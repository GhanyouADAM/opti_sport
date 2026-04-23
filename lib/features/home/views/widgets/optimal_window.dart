import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';

class OptiSportOptimalWindowCard extends StatelessWidget {
  final String title;
  final String startTime;
  final String endTime;
  final String period;
  final String subtitle;
  final String iconName;
  final Color accentColor;
  final Color backgroundColor;

  const OptiSportOptimalWindowCard({
    super.key,
    this.title = "OPTIMAL WINDOW",
    required this.startTime,
    required this.endTime,
    required this.period,
    this.subtitle = "Peak performance conditions predicted.",
    this.iconName = "sun-dim",
    this.accentColor = const Color(0xFF00FFAA),
    this.backgroundColor = const Color(0xFF1A1E26),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // La décoration de la carte principale
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      // ClipRRect permet à la ligne colorée à gauche de suivre l'arrondi de la carte
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // 1. La ligne d'accentuation verticale à gauche
              Container(width: 4, color: accentColor),

              // 2. Le contenu de la carte
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- LIGNE 1 : Titre et Icône ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          AppIcon(
                            name: iconName,
                            primaryColor: accentColor,
                            size: 24,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // --- LIGNE 2 : Les Horaires (Alignés sur la ligne de base) ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            startTime,
                            style: TextStyle(
                              color: context.colorScheme.onSurface,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "–", // Tiret d'espacement
                              style: TextStyle(
                                color: context.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Text(
                            endTime,
                            style: TextStyle(
                              color: context.colorScheme.onSurface,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            period,
                            style: TextStyle(
                              color: context.colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // --- LIGNE 3 : Sous-titre ---
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: context.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
