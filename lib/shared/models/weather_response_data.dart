import 'package:clima_run/shared/models/weather_hourly_raw_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'weather_response_data.mapper.dart';

@MappableClass()
class WeatherResponseData with WeatherResponseDataMappable {
  final double latitude;
  final double longitude;
  final double elevation;
  final String timezone;
  final WeatherHourlyRawData hourly;

  WeatherResponseData({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.timezone,
    required this.hourly,
  });
}
