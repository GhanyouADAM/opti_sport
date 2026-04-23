import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;

  // Paramètres optionnels pour le bouton secondaire
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Détermine si on doit afficher un ou deux boutons
    final bool hasSecondaryButton = secondaryButtonText != null;

    return Dialog(
      backgroundColor: context.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Bords arrondis
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // La dialog s'adapte à son contenu
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Titre ---
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // --- Contenu (Message) ---
            Text(
              content,
              style: const TextStyle(
                color: Colors.grey, // Texte gris clair pour la lisibilité
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),

            // --- Boutons ---
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Bouton Annuler/Secondaire (s'il existe)
                if (hasSecondaryButton) ...[
                  TextButton(
                    onPressed:
                        onSecondaryPressed ?? () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: Text(secondaryButtonText!),
                  ),
                  const SizedBox(width: 12),
                ],

                // Bouton Principal / Confirmer
                ElevatedButton(
                  onPressed: onPrimaryPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FFC4), // Vert fluo
                    foregroundColor: const Color(
                      0xFF121212,
                    ), // Texte noir/sombre
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Arrondi léger
                    ),
                  ),
                  child: Text(
                    primaryButtonText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
