import 'package:clima_run/features/timeline/models/hourly_slot.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'forecast_day.mapper.dart';

@MappableClass()
class ForecastDay with ForecastDayMappable {
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final int dominantWeatherCode;
  final HourlySlot bestSlot;
  final int dayScore;

  ForecastDay({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.dominantWeatherCode,
    required this.bestSlot,
    required this.dayScore,
  });
}
