import 'dart:async';

import 'package:clima_run/core/constants/enums.dart';
import 'package:clima_run/core/constants/score_constants.dart';
import 'package:clima_run/features/home/models/recommendation.dart';
import 'package:clima_run/features/profile/models/user_profile.dart';
import 'package:clima_run/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:clima_run/features/timeline/models/hourly_slot.dart';
import 'package:clima_run/features/timeline/viewmodels/timeline_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewmodel extends AsyncNotifier<Recommendation?> {
  static const List<FitnessLevelScore> fitnessLevels =
      ScoreConstants.fitnessLevels;
  static const List<WeightPerActivityType> weightPerActivityType =
      ScoreConstants.weightPerActivityType;
  @override
  FutureOr<Recommendation?> build() async {
    final hourlySlots = await ref.watch(timelineViewModelProvider.future);
    final profile = await ref.watch(profileViewModelProvider.future);
    if (hourlySlots.isEmpty) return null;
    final bestSlot = _findBestWindow(hourlySlots);
    return bestSlot == null
        ? null
        : _buildRecommandation(bestSlot, hourlySlots, profile);
  }

  HourlySlot? _findBestWindow(List<HourlySlot> hourlySlots) {
    int bestScore = 0;
    List<HourlySlot> bestPair = [];
    for (var i = 0; i < hourlySlots.length - 1; i++) {
      var pair = [hourlySlots[i], hourlySlots[i + 1]];
      var pairScore = pair.map((e) => e.score).reduce((a, b) => a + b);
      if (pairScore > bestScore) {
        bestScore = pairScore;
        bestPair = pair;
      }
    }
    return bestPair.isEmpty ? null : bestPair.first;
  }

  Recommendation _buildRecommandation(
    HourlySlot bestSlot,
    List<HourlySlot> allSlot,
    UserProfile? profile,
  ) {
    final reasons = <String>[];
    final warnings = <String>[];
    final nextSlotsAfterBestSlot = allSlot
        .where((element) => element.hour.isAfter(bestSlot.hour))
        .take(3)
        .toList();
    final fitnessLevelScore = fitnessLevels.firstWhere(
      (f) => f.fitnessLevel == profile?.fitnessLevel,
      orElse: () => FitnessLevelScore(),
    );
    final idealMaxTemp = fitnessLevelScore.bestConditonsTemp;
    final criticalTemp = fitnessLevelScore.badConditionsMaxTemp;
    //=============== construction des messages ==================
    if (bestSlot.uvIndex < 3) reasons.add('UV faibles');
    if (bestSlot.temperature >= 18 && bestSlot.temperature <= idealMaxTemp) {
      reasons.add('Température idéale');
    }
    if (bestSlot.humidity < 60) reasons.add('Humidité confortable');
    if (bestSlot.windSpeed < 15) reasons.add('Vent léger');
    if (bestSlot.precipitationProbability < 20) {
      reasons.add('Faible risque de pluie');
    }
    for (var slot in nextSlotsAfterBestSlot) {
      if (slot.uvIndex > 6) {
        if (!warnings.contains('UV élevés plus tard dans la matinée')) {
          warnings.add('UV élevés plus tard dans la matinée');
        }
      }
      if (slot.temperature > criticalTemp) {
        if (!warnings.contains('Chaleur importante en hausse')) {
          warnings.add('Chaleur importante en hausse dans la journée');
        }
      }
      if (slot.precipitationProbability > 60) {
        if (!warnings.contains('Risque de pluie en augmentation')) {
          warnings.add('Risque de pluie en augmentation');
        }
      }
    }
    return Recommendation(
      bestStartHour: bestSlot.hour,
      bestEndHour: bestSlot.hour.add(Duration(hours: 1)),
      score: bestSlot.score,
      scoreLabel: bestSlot.scoreLabel,
      reasons: reasons,
      warnings: warnings,
      activityType: profile?.activityType ?? ActivityType.running,
      fitnessLevel: profile?.fitnessLevel ?? FitnessLevel.beginner,
    );
  }
}

final homeViewModelProvider =
    AsyncNotifierProvider<HomeViewmodel, Recommendation?>(HomeViewmodel.new);
