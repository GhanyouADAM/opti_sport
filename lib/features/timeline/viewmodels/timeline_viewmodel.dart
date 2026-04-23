import 'dart:async';

import 'package:clima_run/core/constants/score_calculator.dart';
import 'package:clima_run/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:clima_run/features/timeline/models/hourly_slot.dart';
import 'package:clima_run/shared/models/cached_weather_entry.dart';
import 'package:clima_run/shared/providers/core_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/score_constants.dart';

class TimelineViewmodel extends AsyncNotifier<List<HourlySlot>> {
  static const List<FitnessLevelScore> fitnessLevels =
      ScoreConstants.fitnessLevels;
  static const List<WeightPerActivityType> weightPerActivityType =
      ScoreConstants.weightPerActivityType;
  @override
  FutureOr<List<HourlySlot>> build() async {
    //============== Récupération des données ======================
    final (entries, profile) = await (
      ref.watch(weatherEntriesProvider.future),
      ref.watch(profileViewModelProvider.future),
    ).wait;

    //============= Filtrer sur 24h ================================
    final filtered = _filterEntries(entries);

    //============== Transformer chaque entrée en HourlySlot ====================
    return filtered.map((entry) {
      final score = ScoreCalculator.calculateScore(entry, profile);
      return _toHourlySlot(entry, score);
    }).toList();
  }

  List<CachedWeatherEntry> _filterEntries(List<CachedWeatherEntry> entries) {
    final now = DateTime.now();
    final next24h = now.add(const Duration(hours: 24));
    return entries
        .where(
          (entry) => entry.hour.isAfter(now) && entry.hour.isBefore(next24h),
        )
        .toList();
  }

  HourlySlot _toHourlySlot(CachedWeatherEntry entry, int score) {
    return HourlySlot(
      hour: entry.hour,
      temperature: entry.temperature,
      humidity: entry.humidity,
      apparentTemperature: entry.apparentTemperature,
      windSpeed: entry.windspeed,
      uvIndex: entry.uvIndex,
      precipitationProbability: entry.precipitationProbability,
      weathercode: entry.weathercode,
      score: score,
      scoreLabel: _scoreLabel(score),
    );
  }

  ScoreLabel _scoreLabel(int score) {
    if (score >= 80) {
      return ScoreLabel.excellent;
    } else if (score >= 60) {
      return ScoreLabel.bon;
    } else if (score >= 40) {
      return ScoreLabel.moyen;
    } else {
      return ScoreLabel.mauvais;
    }
  }
}

final timelineViewModelProvider =
    AsyncNotifierProvider<TimelineViewmodel, List<HourlySlot>>(
      TimelineViewmodel.new,
    );
