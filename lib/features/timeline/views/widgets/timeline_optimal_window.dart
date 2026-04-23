import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

class OptiSportDailyOptimalWindow extends StatelessWidget {
  final String title;
  final String timeRange;
  final String tagLabel;
  final String temperature;
  final String tempLabel;
  final Color accentColor;
  final Color backgroundColor;

  const OptiSportDailyOptimalWindow({
    super.key,
    this.title = "CRENEAU OPTIMAL",
    required this.timeRange,
    this.tagLabel = "PRIME",
    required this.temperature,
    this.tempLabel = "Moy. Temp",
    this.accentColor = const Color(
      0xFF00E5FF,
    ), // Un cyan néon adapté à cet écran
    this.backgroundColor = const Color(
      0xFF1E2228,
    ), // Gris foncé du fond de carte
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        // On peut ajouter une très légère bordure pour faire ressortir la carte du fond
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1.0,
        ),
      ),
      child: IntrinsicHeight(
        // Permet au Divider de prendre la hauteur de la Row
        child: Row(
          children: [
            // --- PARTIE GAUCHE (Horaires et Badge) ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        timeRange,
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      // Le petit badge "PRIME"
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor.withValues(
                            alpha: 0.15,
                          ), // Fond semi-transparent
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          tagLabel,
                          style: TextStyle(
                            color: accentColor,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --- SEPARATEUR VERTICAL ---
            VerticalDivider(
              color: context.colorScheme.onSurface.withValues(alpha: 0.1),
              thickness: 1.0,
              width: 30.0, // Espace horizontal total pris par le divider
            ),

            // --- PARTIE DROITE (Température) ---
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  temperature,
                  style: TextStyle(
                    color: context.colorScheme.onSurface,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tempLabel,
                  style: TextStyle(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
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
