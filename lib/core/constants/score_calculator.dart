import 'package:clima_run/core/constants/score_constants.dart';

import '../../features/profile/models/user_profile.dart';
import '../../shared/models/cached_weather_entry.dart';
import 'enums.dart';

class ScoreCalculator {
  static const fitnessLevels = ScoreConstants.fitnessLevels;
  static const weightPerActivityType = ScoreConstants.weightPerActivityType;

  static int calculateScore(CachedWeatherEntry entry, UserProfile? profile) {
    //===================== Récuperation des seuils ====================
    final fitnessLevelScore = fitnessLevels.firstWhere(
      (f) => f.fitnessLevel == profile?.fitnessLevel,
      orElse: () => FitnessLevelScore(),
    );
    final idealMaxTemp = fitnessLevelScore.bestConditonsTemp;
    final criticalTemp = fitnessLevelScore.badConditionsMaxTemp;
    final weightsPerActivity = weightPerActivityType
        .firstWhere(
          (f) => f.activityType == profile?.activityType,
          orElse: () => WeightPerActivityType.defaultValues(),
        )
        .factorsWeight;
    //==================== calcul du score par facteur ==============================

    //temperature
    final temp = entry.temperature;
    final double tempScore;
    if (temp < 18) {
      tempScore = _helper(
        temp,
        8,
        18,
        0.0,
        1.0,
      ); // se dégrade sous 18 dégré celsius
    } else if (temp <= idealMaxTemp) {
      tempScore = 1.0;
    } else if (temp <= criticalTemp) {
      tempScore = _helper(
        temp,
        idealMaxTemp.toDouble(),
        criticalTemp.toDouble(),
        1.0,
        0.5,
      );
    } else {
      tempScore = _helper(
        temp,
        criticalTemp.toDouble(),
        criticalTemp + 10.0,
        0.5,
        0.0,
      );
    }

    //humidité
    final humidity = entry.humidity.toDouble();
    final double humidityScore;
    if (humidity < 60) {
      humidityScore = 1.0;
    } else if (humidity <= 80) {
      humidityScore = _helper(humidity, 60, 80, 1.0, 0.5);
    } else {
      humidityScore = _helper(humidity, 80, 100, 0.5, 0.0);
    }

    // UV
    final uv = entry.uvIndex;
    final double uvScore;
    if (uv < 3) {
      uvScore = 1.0;
    } else if (uv <= 6) {
      uvScore = _helper(uv, 3, 6, 1.0, 0.5);
    } else if (uv <= 11) {
      uvScore = _helper(uv, 6, 11, 0.5, 0.0);
    } else {
      uvScore = 0.0;
    }

    // Vent
    final wind = entry.windspeed;
    final double windScore;
    if (wind <= 15) {
      windScore = 1.0;
    } else if (wind <= 30) {
      windScore = _helper(wind, 15, 30, 1.0, 0.5);
    } else {
      windScore = _helper(wind, 30, 60, 0.5, 0.0);
    }

    // Précipitations
    final precipScore = 1.0 - (entry.precipitationProbability / 100.0);

    // Qualité de l'air
    final aqi = entry.usAqi?.toDouble();
    final double aqiScore;
    if (aqi == null) {
      aqiScore = 0.8;
    } else if (aqi < 50) {
      aqiScore = 1.0;
    } else if (aqi <= 100) {
      aqiScore = _helper(aqi, 50, 100, 1.0, 0.5);
    } else {
      aqiScore = _helper(aqi, 100, 200, 0.5, 0.0);
    }

    //====================== calcul du score brut ==================
    final rawScore =
        (tempScore * weightsPerActivity['temperature']!) +
        (humidityScore * weightsPerActivity['humidity']!) +
        (uvScore * weightsPerActivity['uv']!) +
        (windScore * weightsPerActivity['wind']!) +
        (precipScore * weightsPerActivity['precipitations']!) +
        (aqiScore * weightsPerActivity['airQuality']!);
    //pourcentage du score
    double scoreOn100 = rawScore * 100;

    // ================== calcul final en fonction du coefficient de chaleur ====================
    if (entry.temperature > criticalTemp) {
      final coefficient = switch (profile?.heatSensitivity) {
        HeatSensitivity.low => 1.0,
        HeatSensitivity.mid => 0.85,
        HeatSensitivity.high => 0.70,
        null => 1.0,
      };
      scoreOn100 *= coefficient;
    }

    return scoreOn100.clamp(0, 100).round();
  }

  static double _helper(
    double val,
    double inMin,
    double inMax,
    double outMin,
    double outMax,
  ) {
    return (outMin + (val - inMin) / (inMax - inMin) * (outMax - outMin)).clamp(
      outMin < outMax ? outMin : outMax,
      outMin < outMax ? outMax : outMin,
    );
  }

  // static int calculateScore(CachedWeatherEntry entry, UserProfile? profile) {
  //   return _calculateScore(entry, profile);
  // }

  ScoreCalculator._();
}
