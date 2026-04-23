import 'package:dart_mappable/dart_mappable.dart';

part 'weather_hourly_raw_data.mapper.dart';

@MappableClass()
class WeatherHourlyRawData with WeatherHourlyRawDataMappable {
  @MappableField(key: 'temperature_2m')
  final List<double> temperature;
  @MappableField(key: 'relative_humidity_2m')
  final List<int> humidity;
  @MappableField(key: 'windspeed_10m')
  final List<double> windSpeed;
  final List<String> time;
  @MappableField(key: 'apparent_temperature')
  final List<double> apparentTemperature;
  @MappableField(key: 'precipitation_probability')
  final List<int> precipitationProbability;
  @MappableField(key: 'uv_index')
  final List<double> uvIndex;
  final List<int> cloudcover;
  final List<int> weathercode;

  WeatherHourlyRawData({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.time,
    required this.apparentTemperature,
    required this.precipitationProbability,
    required this.uvIndex,
    required this.cloudcover,
    required this.weathercode,
  });
}
