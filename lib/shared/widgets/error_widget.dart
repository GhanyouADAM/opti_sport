import 'package:flutter/material.dart';

import '../../core/constants/app_icon.dart';

class OptiSportErrorWidget extends StatelessWidget {
  final String title;
  final String message;
  final String iconName;
  final VoidCallback? onRetry;
  final String retryButtonText;
  final Color errorColor;

  const OptiSportErrorWidget({
    super.key,
    this.title = "Oops! Something went wrong.",
    this.message =
        "We couldn't fetch your training data. Please check your connection and try again.",
    this.iconName =
        "warning_triangle", // Remplace par ton icône d'erreur (ex: cloud_off)
    this.onRetry,
    this.retryButtonText = "TRY AGAIN",
    this.errorColor = const Color(
      0xFFFF5252,
    ), // Rouge par défaut, mais modifiable
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centre le contenu globalement
      child: Container(
        margin: const EdgeInsets.all(24.0),
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          color: const Color(
            0xFF1E2228,
          ), // Couleur de fond sombre de tes cartes
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: errorColor.withValues(alpha: 0.3), // Bordure légère teintée
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // La carte s'adapte à son contenu
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cercle avec l'icône d'erreur
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: errorColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: AppIcon(
                name: iconName,
                size: 40.0,
                primaryColor: errorColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Titre de l'erreur
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),

            // Message descriptif
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 14.0,
                height: 1.5,
              ),
            ),

            // Bouton de réessai (affiché uniquement si onRetry est fourni)
            if (onRetry != null) ...[
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: errorColor, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: errorColor.withValues(alpha: 0.15),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIcon(
                        name:
                            "refresh", // Assure-toi d'avoir une icône refresh/reload en SVG
                        size: 16.0,
                        primaryColor: errorColor,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        retryButtonText,
                        style: TextStyle(
                          color: errorColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
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
