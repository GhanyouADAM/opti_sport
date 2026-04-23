import 'package:clima_run/core/constants/errors.dart';
import 'package:clima_run/shared/models/air_quality_response_data.dart';
import 'package:clima_run/shared/models/weather_response_data.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

// le coeur de l'appel API
class WeatherApiServices {
  final Dio _dio;

  WeatherApiServices(this._dio);

  //Nos api
  static const String _weatherBaseUrl =
      'https://api.open-meteo.com/v1/forecast';
  static const String _airQualityBaseUrl =
      'https://air-quality-api.open-meteo.com/v1/air-quality';

  Future<Either<Failure, WeatherResponseData>> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      //Récupération des données
      final response = await _dio.get(
        _weatherBaseUrl,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'hourly':
              'temperature_2m,apparent_temperature,relative_humidity_2m,precipitation_probability,windspeed_10m,uv_index,cloudcover,weathercode',
          'forecast_days': 7,
          'timezone': 'auto',
        },
      );
      //vérificaton des données HTTP
      if (response.statusCode != 200) {
        return left(
          ServerFailure(
            'API météo a retourné ${response.statusCode}',
            response.statusCode,
          ),
        );
      }

      //Parsing des données
      final data = WeatherResponseDataMapper.fromMap(
        response.data as Map<String, dynamic>,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(_handleDioException(e));
      }
      return left(ParsingFailure('Erreur inattendue : $e'));
    }
  }

  Future<Either<Failure, AirQualityResponseData>> fetchAirQuality({
    required double latitude,
    required double longitude,
  }) async {
    try {
      //Recupération des données
      final response = await _dio.get(
        _airQualityBaseUrl,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'hourly': 'pm2_5,us_aqi',
          'forecast_days': 7,
          'timezone': 'auto',
        },
      );

      //Vérification des données HTTP
      if (response.statusCode != 200) {
        return left(
          ServerFailure(
            'API qualité de  l\'air a retournée ${response.statusCode}',
            response.statusCode,
          ),
        );
      }

      //Parsing des données
      final data = AirQualityResponseDataMapper.fromMap(
        response.data as Map<String, dynamic>,
      );

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(_handleDioException(e));
      }
      return left(ParsingFailure('Erreur inattendue: $e'));
    }
  }

  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkTimeoutFailure();

      case DioExceptionType.connectionError:
        return NetworkFailure();

      case DioExceptionType.badResponse:
        return ServerFailure(
          'Erreur ${e.response?.statusCode}',
          e.response?.statusCode,
        );

      default:
        return ServerFailure(e.message);
    }
  }
}
