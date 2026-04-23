import 'package:clima_run/features/profile/models/user_profile.dart';
import 'package:clima_run/shared/services/database_helper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/constants/errors.dart';

class ProfileRepository {
  final DatabaseHelper databaseHelper;
  final SupabaseClient supabaseClient;

  ProfileRepository(this.databaseHelper, this.supabaseClient);
  Future<Either<Failure, UserProfile>> getProfile() async {
    try {
      final cachedProfile = await databaseHelper.getUserProfile();
      if (cachedProfile != null) {
        return right(UserProfileMapper.fromMap(cachedProfile));
      }
      // Pas de profil local → retourne immédiatement
      return left(CacheFailure("Aucun profil n'existe"));
    } catch (e) {
      return left(ParsingFailure('Erreur inattendue : $e'));
    }
  }

  Future<Either<Failure, void>> saveProfile(UserProfile profile) async {
    try {
      await databaseHelper.saveUserProfile(profile.toMap());
      final user = supabaseClient.auth.currentUser;

      if (user != null) {
        await _syncToSupabase(profile);
      }
      return right(null);
    } catch (e) {
      return left(ParsingFailure('Erreur inattendue : $e'));
    }
  }

  Future<void> _syncToSupabase(UserProfile profile) async {
    final currentUser = supabaseClient.auth.currentUser;
    if (currentUser == null) return;

    await supabaseClient
        .from('user_profiles')
        .upsert(
          profile.toMap(),
          onConflict: 'user_id', // important pour éviter les doublons
        );
  }

  Future<Either<Failure, void>> syncFromSupabase() async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return left(AuthFailure());
      }
      final supabaseProfile = await _fetchFromSupabase();
      if (supabaseProfile.isLeft()) {
        return left(
          supabaseProfile.fold((failure) => failure, (_) => throw Error()),
        );
      }
      final profile = supabaseProfile.getOrElse((_) => throw Error());
      await databaseHelper.saveUserProfile(profile.toMap());
      return right(null);
    } catch (e) {
      return left(ParsingFailure('Erreur inattendue : $e'));
    }
  }

  Future<Either<Failure, UserProfile>> _fetchFromSupabase() async {
    try {
      final currentUser = supabaseClient.auth.currentUser;
      if (currentUser == null) {
        return left(AuthFailure());
      }
      final response = await supabaseClient
          .from('user_profiles')
          .select()
          .eq('user_id', supabaseClient.auth.currentUser!.id)
          .limit(1)
          .maybeSingle();
      if (response == null) {
        return left(ServerFailure('Aucun profil trouvé'));
      }
      return right(UserProfileMapper.fromMap(response));
    } catch (e) {
      return left(ServerFailure('Erreur inattendue : $e'));
    }
  }
}
