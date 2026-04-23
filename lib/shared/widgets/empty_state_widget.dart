import 'package:flutter/material.dart';

import '../../core/constants/app_icon.dart';

class OptiSportEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final String iconName;
  final Color accentColor;
  final String? actionText;
  final VoidCallback? onAction;

  const OptiSportEmptyState({
    super.key,
    required this.title,
    required this.message,
    required this.iconName,
    this.accentColor = const Color(
      0xFF8E94A3,
    ), // Un gris-bleu neutre par défaut
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // S'adapte à la hauteur du contenu
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- 1. L'icône avec un fond circulaire discret ---
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor.withValues(alpha: 0.1),
                // Une bordure très fine pour le style "Tech"
                border: Border.all(
                  color: accentColor.withValues(alpha: 0.2),
                  width: 1.0,
                ),
              ),
              child: Center(
                child: AppIcon(
                  name: iconName,
                  size: 32.0,
                  primaryColor: accentColor,
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            // --- 2. Le Titre ---
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12.0),

            // --- 3. Le Message explicatif ---
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 15.0,
                height: 1.5, // Meilleure lisibilité
              ),
            ),

            // --- 4. Le Bouton d'action (Optionnel) ---
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: onAction,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 14.0,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: accentColor, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withValues(alpha: 0.1),
                        blurRadius: 12.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Text(
                    actionText!.toUpperCase(),
                    style: TextStyle(
                      color:
                          accentColor, // Le texte prend la couleur d'accentuation
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
