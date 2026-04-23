import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants/errors.dart';
import '../../../core/constants/state/auth_states.dart';
import '../../profile/viewmodels/profile_viewmodel.dart';

class AuthViewmodel extends Notifier<AuthenticationState> {
  @override
  AuthenticationState build() {
    final subscription = Supabase.instance.client.auth.onAuthStateChange.listen(
      (data) {
        switch (data.event) {
          case AuthChangeEvent.signedIn:
            state = AuthAuthenticated(data.session!.user);
            break;
          case AuthChangeEvent.signedOut:
            state = AuthUnauthenticated();
            break;
          case AuthChangeEvent.tokenRefreshed:
            state = AuthAuthenticated(data.session!.user);
            break;
          case AuthChangeEvent.userUpdated:
            state = AuthAuthenticated(data.session!.user);
            break;
          default:
            break;
        }
      },
    );
    ref.onDispose(() => subscription.cancel());
    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      return AuthAuthenticated(session.user);
    } else {
      return AuthUnauthenticated();
    }
  }

  Future<Either<Failure, void>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await ref.read(profileViewModelProvider.notifier).syncAfterLogin();
      return Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(AuthFailure("Erreur inattendue : $e"));
    }
  }

  Future<Either<Failure, void>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await Supabase.instance.client.auth.signUp(
        password: password,
        email: email,
      );
      return Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(AuthFailure("Erreur inattendue : $e"));
    }
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}

final authViewModelProvider =
    NotifierProvider<AuthViewmodel, AuthenticationState>(AuthViewmodel.new);
