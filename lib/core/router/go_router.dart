import 'package:clima_run/core/router/router_refresh.dart';
import 'package:clima_run/features/authentication/views/authentication_page.dart';
import 'package:clima_run/features/forecast/views/forecast_page.dart';
import 'package:clima_run/features/home/views/home_page.dart';
import 'package:clima_run/features/profile/views/profile_page.dart';
import 'package:clima_run/features/timeline/views/timeline_page.dart';
import 'package:clima_run/shared/widgets/screen_molder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/viewmodels/auth_viewmodel.dart';
import '../../features/authentication/views/on_boarding_page.dart';
import '../../features/profile/viewmodels/profile_viewmodel.dart';
import '../constants/state/auth_states.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: RouterRefreshNotifier(ref),
    redirect: (context, state) {
      final authState = ref.read(authViewModelProvider);
      final profileState = ref.read(profileViewModelProvider);

      final isAuthenticated = authState is AuthAuthenticated;
      final isProfileLoading = profileState.isLoading;
      final hasProfile = profileState.hasValue && profileState.value != null;

      final isOnAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';
      final isOnOnboarding = state.matchedLocation == '/onboarding';
      final isOnSplash = state.matchedLocation == '/splash';

      // ──────────────────────────────────────────────────────────────
      // 1. Profil en cours de chargement après login → splash (seulement au début)
      //    On NE redirige PLUS vers splash si on est déjà sur l'onboarding
      // ──────────────────────────────────────────────────────────────
      if (isAuthenticated && isProfileLoading) {
        // On n'envoie au splash QUE si on vient du login/register ou du splash lui-même
        if (isOnAuthRoute || isOnSplash) {
          return '/splash';
        }
        // Sinon (on est sur /onboarding pendant le saveProfile) → on reste là
        return null;
      }

      // 2. Non connecté → login
      if (!isAuthenticated) {
        return isOnAuthRoute ? null : '/login';
      }

      // 3. Connecté mais pas encore de profil → onboarding
      if (isAuthenticated && !hasProfile && !isProfileLoading) {
        return isOnOnboarding ? null : '/onboarding';
      }

      // 4. Connecté + profil chargé → on redirige automatiquement depuis onboarding/auth
      if (isAuthenticated && hasProfile) {
        if (isOnAuthRoute || isOnOnboarding || isOnSplash) {
          return '/home';
        }
      }

      // 5. Tout est bon → aucune redirection
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => AuthentificationPage(title: 'Bienvenue'),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) =>
            AuthentificationPage(title: 'Rejoignez-nous', isLogin: false),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) =>
            Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScreenMolder(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellHomeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellTimelineNavigatorKey,
            routes: [
              GoRoute(
                path: '/timeline',
                builder: (context, state) => const TimelinePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellForecastNavigatorKey,
            routes: [
              GoRoute(
                path: '/forecast',
                builder: (context, state) => const ForecastPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellProfileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

//<---------------- Global keys ----------------------->
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellHomeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _shellTimelineNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'timeline');
final GlobalKey<NavigatorState> _shellForecastNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'forecast');
final GlobalKey<NavigatorState> _shellProfileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');
