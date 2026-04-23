import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/constants/enums.dart';

part 'hourly_slot.mapper.dart';

@MappableClass()
class HourlySlot with HourlySlotMappable {
  final DateTime hour;
  final double temperature;
  final int humidity;
  final double apparentTemperature;
  final double windSpeed;
  final double uvIndex;
  final int precipitationProbability;
  final int weathercode;
  final int? usAqi;
  final int score;
  final ScoreLabel scoreLabel;

  HourlySlot({
    required this.hour,
    required this.temperature,
    required this.humidity,
    required this.apparentTemperature,
    required this.windSpeed,
    required this.uvIndex,
    required this.precipitationProbability,
    required this.weathercode,
    this.usAqi,
    required this.score,
    required this.scoreLabel,
  });
}
