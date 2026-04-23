import 'package:dart_mappable/dart_mappable.dart';

import 'air_quality_hourly_raw_data.dart';

part 'air_quality_response_data.mapper.dart';

@MappableClass()
class AirQualityResponseData with AirQualityResponseDataMappable {
  final double latitude;
  final double longitude;
  final AirQualityHourlyRawData hourly;

  AirQualityResponseData({
    required this.latitude,
    required this.longitude,
    required this.hourly,
  });
}
