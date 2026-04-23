import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';
// N'oublie pas ton import pour AppIcon
// import 'chemin/vers/app_icon.dart';

class OptiSportAlertCard extends StatelessWidget {
  final String title;
  final String message;
  final String iconName;
  final Color iconColor;
  final Color backgroundColor;

  const OptiSportAlertCard({
    super.key,
    required this.title,
    required this.message,
    required this.iconName,
    this.iconColor = const Color(0xFFFFB020),
    this.backgroundColor = const Color(
      0xFF1A1E26,
    ), // Couleur de fond de la carte
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligne l'icône en haut
        children: [
          // L'icône d'alerte
          AppIcon(name: iconName, size: 24.0, primaryColor: iconColor),
          const SizedBox(width: 16.0), // Espace entre l'icône et le texte
          // Le contenu texte (Expanded pour le retour à la ligne)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 14.0,
                    height:
                        1.4, // Interligne légèrement augmenté pour la lisibilité
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
