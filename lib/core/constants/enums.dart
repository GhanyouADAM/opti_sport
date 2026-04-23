import 'package:dart_mappable/dart_mappable.dart';

part 'enums.mapper.dart';

@MappableEnum(mode: ValuesMode.named)
enum ActivityType { running, cycling, football, walking, hikeOrTrekking }

@MappableEnum(mode: ValuesMode.named)
enum FitnessLevel { beginner, intermediate, advanced }

@MappableEnum(mode: ValuesMode.named)
enum HeatSensitivity { low, mid, high }

enum ScoreLabel { excellent, bon, moyen, mauvais }
