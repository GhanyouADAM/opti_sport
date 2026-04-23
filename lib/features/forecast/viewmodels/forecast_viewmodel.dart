import 'dart:async';

import 'package:clima_run/features/forecast/models/forecast_day.dart';
import 'package:clima_run/features/profile/models/user_profile.dart';
import 'package:clima_run/shared/models/cached_weather_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/score_calculator.dart';
import '../../../shared/providers/core_providers.dart';
import '../../profile/viewmodels/profile_viewmodel.dart';
import '../../timeline/models/hourly_slot.dart';

class ForecastViewmodel extends AsyncNotifier<List<ForecastDay>> {
  @override
  FutureOr<List<ForecastDay>> build() async {
    final (entries, profile) = await (
      ref.watch(weatherEntriesProvider.future),
      ref.watch(profileViewModelProvider.future),
    ).wait;

    final grouped = _groupBy(entries);

    return grouped.entries
        .map((e) => _buildForecastDay(e.key, e.value, profile))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  Map<DateTime, List<CachedWeatherEntry>> _groupBy(
    List<CachedWeatherEntry> entries,
  ) {
    final Map<DateTime, List<CachedWeatherEntry>> grouped = {};
    for (var entry in entries) {
      final key = DateTime(entry.hour.year, entry.hour.month, entry.hour.day);
      grouped.putIfAbsent(key, () => []).add(entry);
    }
    return grouped;
  }

  ForecastDay _buildForecastDay(
    DateTime date,
    List<CachedWeatherEntry> entries,
    UserProfile? profile,
  ) {
    final minTemp = entries
        .map((e) => e.temperature)
        .reduce((value, element) => value < element ? value : element);
    final maxTemp = entries
        .map((e) => e.temperature)
        .reduce((value, element) => value > element ? value : element);
    Map<int, int> weatherCodes = {};
    final listOfScores = entries
        .map((entry) => ScoreCalculator.calculateScore(entry, profile))
        .toList();
    final maxScoreIndex = listOfScores.indexOf(
      listOfScores.reduce(
        (value, element) => value > element ? value : element,
      ),
    );
    for (var entry in entries) {
      weatherCodes[entry.weathercode] =
          (weatherCodes[entry.weathercode] ?? 0) + 1;
    }
    final dominantWeatherCode = weatherCodes.entries
        .reduce(
          (value, element) => value.value > element.value ? value : element,
        )
        .key;
    final bestSlot = _toHourlySlot(
      entries[maxScoreIndex],
      listOfScores[maxScoreIndex],
    );
    final avgScore =
        listOfScores.reduce((value, element) => value + element) /
        listOfScores.length;
    return ForecastDay(
      date: date,
      minTemperature: minTemp,
      maxTemperature: maxTemp,
      dominantWeatherCode: dominantWeatherCode,
      bestSlot: bestSlot,
      dayScore: avgScore.toInt(),
    );
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

final forecastViewModelProvider =
    AsyncNotifierProvider<ForecastViewmodel, List<ForecastDay>>(
      ForecastViewmodel.new,
    );
