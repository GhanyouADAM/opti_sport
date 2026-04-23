import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';

class OptiSportTimelineItem extends StatelessWidget {
  final String time;
  final String period;
  final String temperature;
  final String humidity;
  final String uvIndex;
  final String windSpeed;
  final bool isRecommended;
  final double intensityLevel; // De 0.0 à 1.0 pour remplir la barre de droite
  final Color intensityColor;

  const OptiSportTimelineItem({
    super.key,
    required this.time,
    required this.period,
    required this.temperature,
    required this.humidity,
    required this.uvIndex,
    required this.windSpeed,
    this.isRecommended = false,
    required this.intensityLevel,
    this.intensityColor = const Color(0xFF00E5FF), // Cyan par défaut
  });

  @override
  Widget build(BuildContext context) {
    // Couleurs de base adaptées au design
    final Color accentColor = context.colorScheme.primary;
    final Color borderColor = isRecommended
        ? accentColor
        : context.colorScheme.onSurface.withValues(alpha: 0.08);
    final Color timeColor = isRecommended ? accentColor : Colors.white;

    return Stack(
      children: [
        // 1. LE CONTAINER PRINCIPAL
        Container(
          margin: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ), // Espacement entre les items de la liste
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          decoration: BoxDecoration(
            color:
                Colors.transparent, // Le fond semble transparent ou très sombre
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: borderColor,
              width: isRecommended
                  ? 1.5
                  : 1.0, // Bordure un peu plus épaisse si recommandé
            ),
          ),
          child: Row(
            children: [
              // --- GAUCHE : L'heure ---
              SizedBox(
                width:
                    65, // Largeur fixe pour que toutes les lignes soient bien alignées
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        color: timeColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      period,
                      style: TextStyle(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Séparateur discret
              Container(
                height: 40,
                width: 1,
                color: context.colorScheme.onSurface.withValues(alpha: 0.1),
                margin: const EdgeInsets.only(right: 12.0),
              ),

              // --- CENTRE : Les 4 métriques ---
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetric(
                      "thermometer-simple",
                      temperature,
                      context,
                      Colors.orange,
                    ), // Remplace par tes noms de SVG
                    _buildMetric("drop", humidity, context, Colors.cyanAccent),
                    _buildMetric("sun-dim", uvIndex, context, Colors.yellow),
                    _buildMetric("wind", windSpeed, context, null),
                  ],
                ),
              ),

              const SizedBox(width: 16.0),

              // --- DROITE : La barre d'intensité ---
              Container(
                width: 4.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: intensityLevel.clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: intensityColor,
                      borderRadius: BorderRadius.circular(4.0),
                      // Effet néon si c'est la couleur d'accentuation
                      boxShadow: intensityColor == accentColor
                          ? [
                              BoxShadow(
                                color: accentColor.withValues(alpha: 0.5),
                                blurRadius: 4,
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 2. LE BADGE "RECOMMENDED" (Affiché uniquement si isRecommended est true)
        if (isRecommended)
          Positioned(
            top: 8.0, // Doit correspondre au margin top du Container principal
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(
                    24.0,
                  ), // Épouse le bord du container
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: const Text(
                "RECOMMENDED",
                style: TextStyle(
                  color: Color(
                    0xFF161A20,
                  ), // Couleur de texte sombre pour contraster
                  fontSize: 9.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Sous-widget privé pour construire chaque petite colonne de métrique
  Widget _buildMetric(
    String iconName,
    String value,
    BuildContext context,
    Color? color,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(
          name: iconName,
          size: 20.0,
          primaryColor: color ?? const Color(0xFF8E94A3),
        ),
        const SizedBox(height: 6.0),
        Text(
          value,
          style: TextStyle(
            color: context.colorScheme.onSurface,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
