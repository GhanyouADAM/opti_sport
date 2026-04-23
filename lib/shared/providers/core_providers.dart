import 'dart:async';

import 'package:clima_run/core/constants/enums.dart';
import 'package:clima_run/shared/services/database_helper.dart';
import 'package:clima_run/shared/services/location_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/cached_weather_entry.dart';
import '../repositories/profile_repository.dart';
import '../repositories/weather_repository.dart';
import '../services/weather_api_services.dart';

//==================== local database service DI =============================
final sqfliteProvider = Provider<Database>((ref) => throw UnimplementedError());
final databaseHelperProvider = Provider<DatabaseHelper>((ref) {
  final database = ref.watch(sqfliteProvider);
  return DatabaseHelper(database);
});

//==================== weather service DI =============================
final dioProvider = Provider<Dio>((ref) => throw UnimplementedError());
final weatherApiServicesProvider = Provider<WeatherApiServices>((ref) {
  final dio = ref.watch(dioProvider);
  return WeatherApiServices(dio);
});

//==================== location service ================================
final locationServiceProvider = Provider<LocationService>(
  (ref) => LocationService(),
);

//====================== profile repository DI =============================
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(
    ref.watch(databaseHelperProvider),
    Supabase.instance.client,
  );
});
//====================== weather repository DI =============================
final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final databaseHelper = ref.watch(databaseHelperProvider);
  final weatherApiServices = ref.watch(weatherApiServicesProvider);
  final locationService = ref.watch(locationServiceProvider);
  return WeatherRepository(databaseHelper, weatherApiServices, locationService);
});

class WeatherEntriesNotifier extends AsyncNotifier<List<CachedWeatherEntry>> {
  @override
  FutureOr<List<CachedWeatherEntry>> build() async {
    final repository = ref.read(weatherRepositoryProvider);
    final eitherResult = await repository.getWeatherEntries(
      from: null,
      to: null,
    );
    return eitherResult.fold((failure) => throw failure, (entries) => entries);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

final weatherEntriesProvider =
    AsyncNotifierProvider<WeatherEntriesNotifier, List<CachedWeatherEntry>>(
      WeatherEntriesNotifier.new,
    );

//profile configuration provider

final selectedSportProvider = StateProvider<ActivityType>(
  (ref) => ActivityType.running,
);
final selectedLevelProvider = StateProvider<FitnessLevel>(
  (ref) => FitnessLevel.beginner,
);
final selectHeatLevelProvider = StateProvider<HeatSensitivity>(
  (ref) => HeatSensitivity.low,
);
final selectedRangeValueProvider = StateProvider<RangeValues>(
  (ref) => const RangeValues(5.0, 9.5),
);

final userEmailProvider = Provider<String>(
  (ref) => Supabase.instance.client.auth.currentUser!.email!,
);
