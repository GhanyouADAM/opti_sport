import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class AuthAuthenticated extends AuthenticationState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthenticationState {}
