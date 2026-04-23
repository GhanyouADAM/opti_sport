import 'package:clima_run/features/home/models/recommendation.dart';
import 'package:clima_run/features/timeline/models/hourly_slot.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/models/user_location.dart';

extension BuildContextExtension on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeMode get themeMode => Theme.of(this).brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Brightness get brightness => Theme.of(this).brightness;
  bool get isDarkMode => brightness == Brightness.dark;
  bool get isLightMode => brightness == Brightness.light;
}

// --- 2. EXTENSION POUR FORMATEUR DE DATES (FRANÇAIS) ---
extension DateTimeExtension on DateTime {
  // Retourne l'heure au format "HH:mm" (ex: "06:30")
  String get toTimeString {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return "$h:$m";
  }

  String get toDateDayName {
    const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    final dayName = days[weekday - 1];
    return dayName;
  }

  // Retourne la date au format du forecast: "Sam, 12 Oct"
  String get toShortDateString {
    const months = [
      'Jan',
      'Fév',
      'Mar',
      'Avr',
      'Mai',
      'Juin',
      'Juil',
      'Août',
      'Sep',
      'Oct',
      'Nov',
      'Déc',
    ];
    const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

    final dayName = days[weekday - 1];
    final monthName = months[month - 1];

    return "$dayName, $day $monthName";
  }

  // Retourne la date au format du dashboard: "Aujourd'hui, 24 Oct"
  String get toDashboardDateString {
    final now = DateTime.now();
    final isToday = now.year == year && now.month == month && now.day == day;

    const months = [
      'Jan',
      'Fév',
      'Mar',
      'Avr',
      'Mai',
      'Juin',
      'Juil',
      'Août',
      'Sep',
      'Oct',
      'Nov',
      'Déc',
    ];
    final monthName = months[month - 1];

    if (isToday) {
      return "Aujourd'hui, $day $monthName";
    } else {
      return toShortDateString; // Renvoie "Sam, 24 Oct" si ce n'est pas aujourd'hui
    }
  }
}

extension WeatherCodeExtension on int {
  /// Retourne la description météo en français
  String get weatherDescription {
    switch (this) {
      case 0:
        return "Ciel dégagé";
      case 1:
      case 2:
      case 3:
        return "Nuageux";
      case 45:
      case 48:
        return "Brouillard";
      case 51:
      case 53:
      case 55:
        return "Bruine";
      case 61:
      case 63:
      case 65:
        return "Pluie";
      case 71:
      case 73:
      case 75:
        return "Neige";
      case 95:
      case 96:
      case 99:
        return "Orage";
      default:
        return "Inconnu";
    }
  }

  /// Retourne le nom du fichier SVG correspondant
  String get weatherIconName {
    switch (this) {
      case 0:
        return "sun-dim";
      case 1:
      case 2:
      case 3:
        return "cloud";
      case 61:
      case 63:
      case 65:
        return "cloud-rain";
      case 95:
      case 96:
      case 99:
        return "cloud-lightning";
      default:
        return "cloud"; // Icône par défaut
    }
  }
}

// --- 3. EXTENSION POUR FORMATEUR DE NOMBRES (TEMPÉRATURES) ---
// Utiliser 'num' permet à l'extension de fonctionner avec des 'int' et des 'double'
extension NumberExtension on num {
  // Retourne la température avec le suffixe (ex: 24 -> "24°C" ou 24.5 -> "24.5°C")
  String get toCelsius {
    // Si c'est un nombre entier (ou un double comme 24.0), on affiche sans décimale
    if (this == toInt()) {
      return "${toInt()}°C";
    }
    // Sinon, on garde une décimale
    return "${toStringAsFixed(1)}°C";
  }

  // Retourne juste la valeur avec le degré, comme dans la timeline (ex: "24°")
  String get toDegree {
    return "${toInt()}°";
  }
}

extension ReasonsIconsName on Recommendation {
  String iconName(String reason) {
    if (reason == 'UV faibles') {
      return 'sun-horizon';
    }
    if (reason == 'Température idéale') {
      return 'thermometer-cold';
    }
    if (reason == 'Humidité confortable') {
      return 'waves';
    }
    if (reason == 'Vent léger') {
      return 'wind';
    }
    if (reason == 'Faible risque de pluie') {
      return 'cloud-rain';
    }
    return 'sun';
  }

  String warningTitle(String warning) {
    if (warning == 'UV élevés plus tard dans la matinée') {
      return 'Alerte UV';
    }
    if (warning == 'Chaleur importante en hausse dans la journée') {
      return 'Alerte température';
    }
    if (warning == 'Risque de pluie en augmentation') {
      return 'Alerte précipitations';
    }
    return 'Alerte';
  }

  int averageTemp(List<HourlySlot> slots) {
    int sum = 0;
    for (var slot in slots) {
      sum += slot.temperature.round();
    }
    return (sum / slots.length).toInt();
  }
}

extension PositionExtension on Position {
  /// Convertit la Position brute en une entité UserLocation prête pour l'UI
  Future<UserLocation> toUserLocation() async {
    String shortAddress = "Localisation inconnue";
    String fullAddress = "LOCALISATION INCONNUE";

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final city = place.locality ?? place.subAdministrativeArea ?? "Inconnu";
        final countryCode = place.isoCountryCode ?? "";
        final country = place.country ?? "";

        shortAddress = "$city, $countryCode";
        fullAddress = "${city.toUpperCase()}, ${country.toUpperCase()}";
      }
    } catch (e) {
      // En cas d'erreur de geocoding, on garde les strings par défaut
      // mais on renvoie quand même la position GPS
    }

    return UserLocation(
      position: this,
      shortAddress: shortAddress,
      fullAddress: fullAddress,
    );
  }
}

extension Hourly on HourlySlot {
  Color get intensityColor {
    if (score >= 80) return const Color(0xFF00FFC4); // Vert Fluo (Excellent)
    if (score >= 60) return Colors.amber; // Jaune/Ambre (Bon)
    if (score >= 40) return Colors.orange; // Orange (Moyen)
    return Colors.red; // Rouge (Mauvais)
  }

  bool get isRecommended => score >= 75;
}
