import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';

class OptiSportConditionChip extends StatelessWidget {
  final String label;
  final String iconName;
  final Color accentColor;
  final Color textColor;

  const OptiSportConditionChip({
    super.key,
    required this.label,
    required this.iconName,
    this.accentColor = const Color(0xFF00FFAA),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding interne pour donner de l'espace autour du texte et de l'icône
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.transparent, // Fond transparent
        border: Border.all(
          // On réduit un peu l'opacité de la bordure pour que l'icône ressorte plus
          color: accentColor.withValues(alpha: 0.4),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(24.0), // Bords en forme de pilule
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Le chip s'adapte à son contenu
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ton composant SVG
          AppIcon(
            name: iconName,
            size: 16.0, // Petite taille pour s'intégrer au texte
            primaryColor: accentColor,
          ),
          const SizedBox(width: 8.0), // Espace entre l'icône et le texte
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 13.0,
              fontWeight: FontWeight.w600, // Semi-gras pour la lisibilité
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
