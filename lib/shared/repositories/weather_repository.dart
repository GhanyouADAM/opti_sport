import 'package:clima_run/shared/models/air_quality_response_data.dart';
import 'package:clima_run/shared/models/cached_weather_entry.dart';
import 'package:clima_run/shared/models/weather_response_data.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/constants/errors.dart';
import '../services/database_helper.dart';
import '../services/location_service.dart';
import '../services/weather_api_services.dart';

class WeatherRepository {
  final DatabaseHelper _databaseHelper;
  final WeatherApiServices _weatherApiServices;
  final LocationService _locationService;

  WeatherRepository(
    this._databaseHelper,
    this._weatherApiServices,
    this._locationService,
  );

  Future<Either<Failure, List<CachedWeatherEntry>>> getWeatherEntries({
    required DateTime? from,
    required DateTime? to,
  }) async {
    try {
      final eitherLocation = await _locationService.getCurrentLocation();

      // Extraction propre sans "throw Error()"
      if (eitherLocation.isLeft()) {
        return left(
          eitherLocation.match(
            (failure) => failure,
            (_) => UnexpectedFailure(),
          ),
        );
      }
      final location = eitherLocation.getRight().toNullable()!;
      final latitude = location.latitude;
      final longitude = location.longitude;

      final latestCachedAt = await _databaseHelper.getLatestCachedAt();
      final cachedLocation = await _databaseHelper.getCachedLocation();
      final cachedLatitude = cachedLocation?['latitude'];
      final cachedLongitude = cachedLocation?['longitude'];
      final now = DateTime.now();

      bool isCacheExpired = false;
      bool isLocationChanged = false;
      final isCacheEmpty = latestCachedAt == null;

      if (latestCachedAt != null) {
        final cachedAt = DateTime.parse(latestCachedAt);
        final difference = now.difference(cachedAt).inMinutes;
        isCacheExpired = difference > 60;
      }

      if (cachedLatitude != null && cachedLongitude != null) {
        final latitudeDiff = (latitude - cachedLatitude).abs();
        final longitudeDiff = (longitude - cachedLongitude).abs();
        isLocationChanged = latitudeDiff > 0.01 || longitudeDiff > 0.01;
      }

      final listOfCachedWeatherEntries = <CachedWeatherEntry>[];

      if (isCacheEmpty || isCacheExpired || isLocationChanged) {
        await _databaseHelper.clearWeatherEntries();

        // ======= appel API =========
        final weatherCall = _weatherApiServices.fetchWeather(
          latitude: latitude,
          longitude: longitude,
        );
        final airQualityCall = _weatherApiServices.fetchAirQuality(
          latitude: latitude,
          longitude: longitude,
        );

        final result = await Future.wait([weatherCall, airQualityCall]);
        final eitherWeather = result[0] as Either<Failure, WeatherResponseData>;
        final eitherAirQuality =
            result[1] as Either<Failure, AirQualityResponseData>;

        // Remontée des erreurs API sans "throw Error()"
        if (eitherWeather.isLeft()) {
          return left(
            eitherWeather.match(
              (failure) => failure,
              (_) => UnexpectedFailure(),
            ),
          );
        }
        if (eitherAirQuality.isLeft()) {
          return left(
            eitherAirQuality.match(
              (failure) => failure,
              (_) => UnexpectedFailure(),
            ),
          );
        }

        final weatherResponseData = eitherWeather.getRight().toNullable()!;
        final airQualityResponseData = eitherAirQuality
            .getRight()
            .toNullable()!;

        if (weatherResponseData.hourly.time.length !=
            airQualityResponseData.hourly.pm25.length) {
          return left(
            ParsingFailure(
              "Incohérence des données reçues par l'API (tailles différentes)",
            ),
          );
        }

        for (int i = 0; i < weatherResponseData.hourly.time.length; i++) {
          // ======= Enregistrement des données dans la base de données =========
          final weatherRawData = weatherResponseData.hourly;
          final airQualityRawData = airQualityResponseData.hourly;
          final cachedWeatherEntry = CachedWeatherEntry(
            temperature: weatherRawData.temperature[i],
            humidity: weatherRawData.humidity[i],
            windspeed: weatherRawData.windSpeed[i],
            hour: DateTime.parse(weatherRawData.time[i]),
            apparentTemperature: weatherRawData.apparentTemperature[i],
            precipitationProbability:
                weatherRawData.precipitationProbability[i],
            uvIndex: weatherRawData.uvIndex[i],
            cloudcover: weatherRawData.cloudcover[i],
            weathercode: weatherRawData.weathercode[i],
            pm25: airQualityRawData.pm25[i],
            usAqi: airQualityRawData.usAqi[i],
            latitude: latitude,
            longitude: longitude,
            cachedAt: DateTime.now(),
          );
          listOfCachedWeatherEntries.add(cachedWeatherEntry);
        }
        await _databaseHelper.insertWeatherEntries(
          listOfCachedWeatherEntries.map((e) => e.toMap()).toList(),
        );
      } else {
        // ======= Récupération des données de la base de données =========
        final effectiveFrom = from ?? now.subtract(const Duration(hours: 24));
        final effectiveTo = to ?? now.add(const Duration(hours: 24));
        final cachedEntries = await _databaseHelper.getWeatherEntries(
          from: effectiveFrom.toIso8601String(),
          to: effectiveTo.toIso8601String(),
        );
        listOfCachedWeatherEntries.addAll(
          cachedEntries
              .map((entrie) => CachedWeatherEntryMapper.fromMap(entrie))
              .toList(),
        );
      }
      return right(listOfCachedWeatherEntries);
    } catch (e) {
      // Analyse précise de l'erreur
      if (e is FormatException || e is TypeError) {
        return left(ParsingFailure('Erreur de conversion de données : $e'));
      }
      if (e is Failure) {
        return left(e); // Laisse passer les erreurs de type Failure
      }
      // Pour tout le reste (BDD, null check inattendu, etc.)
      return left(UnexpectedFailure('Erreur système inattendue : $e'));
    }
  }
}
