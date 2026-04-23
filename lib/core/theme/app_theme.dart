import 'package:flutter/material.dart';

class AppTheme {
  // Construteur privée pour eviter l'instanciation
  AppTheme._();

  // --- Core Colors ---

  // Light Theme
  static const Color _lightPrimary = Color(0xFFEC5B13);
  // static const Color _lightPrimary = Color(0xFF00E5FF);
  // Dark Theme
  static const Color _darkPrimary = Color(0xFF00FFC4);
  static const Color _darkSurface = Color(0xFF0B1021);
  static const Color _darkSurfaceContainer = Color(0xFF11182B);
  static const Color _darkOnSurfaceVariant = Color(0xFF738194);

  // --- Theme Data ---

  /// Light Theme Configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _lightPrimary,
        brightness: Brightness.light,
        // The seed generates all matching light surface colors automatically,
      ).copyWith(primary: _lightPrimary),
    );
  }

  /// Dark Theme Configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(
            seedColor: _darkPrimary,
            brightness: Brightness.dark,
          ).copyWith(
            primary: _darkPrimary,
            // Override the generated scheme with your specific dark colors
            surface: _darkSurface,
            surfaceContainer: _darkSurfaceContainer,
            // Used for text/icons on top of surface containers
            onSurfaceVariant: _darkOnSurfaceVariant,
          ),

      // Example of applying your container colors to specific UI components:
      appBarTheme: const AppBarTheme(backgroundColor: _darkSurface),
      scaffoldBackgroundColor: _darkSurface,
    );
  }
}
