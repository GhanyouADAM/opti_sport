import 'package:dart_mappable/dart_mappable.dart';

import '../../../core/constants/enums.dart';

part 'recommendation.mapper.dart';

@MappableClass()
class Recommendation with RecommendationMappable {
  final DateTime bestStartHour;
  final DateTime bestEndHour;
  final int score;
  final ScoreLabel scoreLabel;
  final List<String> reasons;
  final List<String> warnings;
  @MappableEnum(mode: ValuesMode.named)
  final ActivityType activityType;
  @MappableEnum(mode: ValuesMode.named)
  final FitnessLevel fitnessLevel;

  Recommendation({
    required this.bestStartHour,
    required this.bestEndHour,
    required this.score,
    required this.scoreLabel,
    required this.reasons,
    required this.warnings,
    required this.activityType,
    required this.fitnessLevel,
  });
}
