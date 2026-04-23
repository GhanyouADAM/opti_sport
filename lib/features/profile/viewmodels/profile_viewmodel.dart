import 'dart:async';

import 'package:clima_run/features/profile/models/user_profile.dart';
import 'package:clima_run/shared/providers/core_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/errors.dart';

class ProfileViewmodel extends AsyncNotifier<UserProfile?> {
  @override
  FutureOr<UserProfile?> build() async {
    final repository = ref.read(profileRepositoryProvider);
    final eitherResult = await repository.getProfile();
    return eitherResult.fold((failure) {
      if (failure is CacheFailure) return null;
      throw failure;
    }, (profile) => profile);
  }

  Future<void> saveProfile(UserProfile profile) async {
    state = const AsyncValue.loading();
    final repository = ref.read(profileRepositoryProvider);
    final eitherResult = await repository.saveProfile(profile);

    state = eitherResult.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (_) => AsyncValue.data(profile),
    );
    // AJOUT : Lève explicitement l'erreur pour l'afficher dans le SnackBar de la vue
    eitherResult.fold(
      (failure) => throw Exception(
        failure.message ?? "Erreur inconnue lors de la sauvegarde",
      ),
      (_) => null, // Succès, on ne fait rien
    );
  }

  Future<void> syncAfterLogin() async {
    // 1. On force l'état en chargement (ce qui maintient le splash screen)
    state = const AsyncValue.loading();
    final repository = ref.read(profileRepositoryProvider);

    // 2. On télécharge le profil depuis Supabase et on le sauvegarde en local
    await repository.syncFromSupabase();

    // 3. On lit le profil local fraîchement récupéré pour mettre à jour l'état
    final result = await repository.getProfile();
    state = result.fold(
      // S'il n'y a pas de profil (nouveau compte sans onboarding), hasProfile passera à false
      (failure) => AsyncValue.data(null),
      // S'il y en a un, hasProfile passera à true -> GoRouter redirigera vers /home
      (profile) {
        return AsyncValue.data(profile);
      },
    );
  }
}

final profileViewModelProvider =
    AsyncNotifierProvider<ProfileViewmodel, UserProfile?>(ProfileViewmodel.new);
