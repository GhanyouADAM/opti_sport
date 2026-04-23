import 'package:clima_run/core/constants/database_schema.dart';
import 'package:clima_run/core/constants/supabase_constant.dart';
import 'package:clima_run/core/router/go_router.dart';
import 'package:clima_run/core/theme/app_theme.dart';
import 'package:clima_run/shared/providers/core_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // =============== configuration base locale(Sqflite) ==================
  final database = await openDatabase(
    join(await getDatabasesPath(), 'optisport.db'),
    version: 1,
    onCreate: DatabaseSchema.createDB,
    onUpgrade: (db, oldVersion, newVersion) async {},
  );
  // =================== configuration supabase ========================
  await Supabase.initialize(
    url: SupabaseConstant.url,
    anonKey: SupabaseConstant.anonKey,
  );
  runApp(
    // =================== configuration riverpod ========================
    ProviderScope(
      overrides: [
        sqfliteProvider.overrideWithValue(database),
        dioProvider.overrideWithValue(Dio()),
      ],
      child: const MainApp(),
    ),
  );
}

// =================== configuration initiale de l'application ========================
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
