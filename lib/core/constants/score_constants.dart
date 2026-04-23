import 'enums.dart';

class ScoreConstants {
  static const List<FitnessLevelScore> fitnessLevels = [
    FitnessLevelScore(
      fitnessLevel: FitnessLevel.beginner,
      bestConditonsTemp: 24,
      badConditionsMaxTemp: 27,
    ),
    FitnessLevelScore(
      fitnessLevel: FitnessLevel.intermediate,
      bestConditonsTemp: 27,
      badConditionsMaxTemp: 30,
    ),
    FitnessLevelScore(
      fitnessLevel: FitnessLevel.advanced,
      bestConditonsTemp: 30,
      badConditionsMaxTemp: 35,
    ),
  ];
  static const List<WeightPerActivityType> weightPerActivityType = [
    WeightPerActivityType(
      activityType: ActivityType.running,
      factorsWeight: {
        'temperature': 0.30,
        'humidity': 0.25,
        'uv': 0.20,
        'wind': 0.10,
        'precipitations': 0.10,
        'airQuality': 0.05,
      },
    ),
    WeightPerActivityType(
      activityType: ActivityType.cycling,
      factorsWeight: {
        'temperature': 0.20,
        'humidity': 0.20,
        'uv': 0.15,
        'wind': 0.25,
        'precipitations': 0.15,
        'airQuality': 0.05,
      },
    ),
    WeightPerActivityType(
      activityType: ActivityType.football,
      factorsWeight: {
        'temperature': 0.20,
        'humidity': 0.25,
        'uv': 0.10,
        'wind': 0.15,
        'precipitations': 0.25,
        'airQuality': 0.05,
      },
    ),
    WeightPerActivityType(
      activityType: ActivityType.walking,
      factorsWeight: {
        'temperature': 0.25,
        'humidity': 0.20,
        'uv': 0.20,
        'wind': 0.15,
        'precipitations': 0.15,
        'airQuality': 0.05,
      },
    ),
    WeightPerActivityType(
      activityType: ActivityType.hikeOrTrekking,
      factorsWeight: {
        'temperature': 0.20,
        'humidity': 0.15,
        'uv': 0.30,
        'wind': 0.15,
        'precipitations': 0.15,
        'airQuality': 0.05,
      },
    ),
  ];

  // Constructeur privé pour empêcher l'instanciation
  ScoreConstants._();
}

class FitnessLevelScore {
  final FitnessLevel fitnessLevel;
  final int bestConditonsTemp;
  final int badConditionsMaxTemp;

  const FitnessLevelScore({
    this.fitnessLevel = FitnessLevel.beginner,
    this.bestConditonsTemp = 24,
    this.badConditionsMaxTemp = 27,
  });
}

class WeightPerActivityType {
  final ActivityType activityType;
  final Map<String, double> factorsWeight;

  const WeightPerActivityType({
    required this.activityType,
    required this.factorsWeight,
  });

  factory WeightPerActivityType.defaultValues({
    ActivityType activityType = ActivityType.running,
  }) {
    return WeightPerActivityType(
      activityType: activityType,
      factorsWeight: {
        'temperature': 0.30,
        'humidity': 0.25,
        'uv': 0.20,
        'wind': 0.10,
        'precipitations': 0.10,
        'airQuality': 0.05,
      },
    );
  }
}
