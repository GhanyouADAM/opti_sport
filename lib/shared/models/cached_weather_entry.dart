import 'package:dart_mappable/dart_mappable.dart';

part 'cached_weather_entry.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class CachedWeatherEntry with CachedWeatherEntryMappable {
  final int? id;
  final double temperature;
  final int humidity;
  final double windspeed;
  final DateTime hour;
  final double apparentTemperature;
  final int precipitationProbability;
  final double uvIndex;
  final int cloudcover;
  final int weathercode;
  @MappableField(key: 'pm25')
  final double? pm25;
  final int? usAqi;
  final double latitude;
  final double longitude;
  final DateTime cachedAt;

  CachedWeatherEntry({
    this.id,
    required this.temperature,
    required this.humidity,
    required this.windspeed,
    required this.hour,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.uvIndex,
    required this.cloudcover,
    required this.weathercode,
    this.pm25,
    this.usAqi,
    required this.latitude,
    required this.longitude,
    required this.cachedAt,
  });
}
