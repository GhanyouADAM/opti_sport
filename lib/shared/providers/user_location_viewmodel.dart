import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/context_extension.dart';
import '../models/user_location.dart';
import '../services/location_service.dart';
// Importe tes fichiers (LocationService, UserLocation, etc.)

// Optionnel: Un provider pour injecter ton LocationService
final locationServiceProvider = Provider((ref) => LocationService());

// Ton ViewModel
class LocationViewModel extends AsyncNotifier<UserLocation> {
  @override
  FutureOr<UserLocation> build() async {
    return _fetchLocation();
  }

  Future<UserLocation> _fetchLocation() async {
    final locationService = ref.read(locationServiceProvider);

    // On récupère le Either<Failure, Position> de ton service
    final result = await locationService.getCurrentLocation();

    // On utilise fpdart pour gérer le succès ou l'erreur
    return result.fold(
      (failure) {
        // En jetant une exception, Riverpod va automatiquement
        // passer l'AsyncValue en état .error()
        throw Exception(failure.message);
      },
      (position) async {
        // Magie : on utilise l'extension pour convertir la Position en UserLocation
        return await position.toUserLocation();
      },
    );
  }

  // Méthode pour rafraîchir manuellement la position (ex: pull-to-refresh)
  Future<void> refreshLocation() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchLocation());
  }
}

// Le provider de ton ViewModel
final locationViewModelProvider =
    AsyncNotifierProvider<LocationViewModel, UserLocation>(
      () => LocationViewModel(),
    );
