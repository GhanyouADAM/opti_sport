import 'package:dart_mappable/dart_mappable.dart';

part 'air_quality_hourly_raw_data.mapper.dart';

@MappableClass()
class AirQualityHourlyRawData with AirQualityHourlyRawDataMappable {
  final List<String> time;
  @MappableField(key: 'pm2_5')
  final List<double?> pm25;
  @MappableField(key: 'us_aqi')
  final List<int?> usAqi;

  AirQualityHourlyRawData({
    required this.time,
    required this.pm25,
    required this.usAqi,
  });
}
