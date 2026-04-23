import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';
import '../../../../core/constants/context_extension.dart';
// N'oublie pas l'import de ta classe utilitaire !
// import 'chemin/vers/app_icon.dart';

class OptiSportFeaturedForecastCard extends StatelessWidget {
  final String dateLabel;
  final String description;
  final String highTemp;
  final String lowTemp;
  final String humidity;
  final int score;
  final String optimalTime;
  final String weatherIconName;

  const OptiSportFeaturedForecastCard({
    super.key,
    this.dateLabel = "Sat, 12 Oct",
    this.description = "Light rain expected around 2 PM",
    required this.highTemp,
    required this.lowTemp,
    required this.humidity,
    required this.score,
    required this.optimalTime,
    required this.weatherIconName,
  });

  @override
  Widget build(BuildContext context) {
    Color primary =
        context.colorScheme.primary; // À ajuster selon ta palette exacte

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        // Un dégradé sombre en remplacement de l'image de fond
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E2638), // Bleu très sombre
            Color(0xFF0B101A), // Presque noir
          ],
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- LIGNE 1 : Badge "Today" et Mini Score ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge "Today"
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  "Aujourd'hui",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Le Mini Score Circulaire
              _MiniCircularScore(score: score, color: primary),
            ],
          ),

          const SizedBox(height: 8.0),

          // --- LIGNE 2 : Date et Description ---
          Text(
            dateLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14.0,
            ),
          ),

          const SizedBox(height: 24.0),

          // --- LIGNE 3 : Météo et Optimal Window ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Bloc Météo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIcon(
                    name: weatherIconName,
                    size: 42.0,
                    primaryColor: Colors.white,
                  ),
                  const SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            highTemp,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " / $lowTemp",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          AppIcon(
                            name: "drop", // Ton icône de goutte d'eau
                            size: 12.0,
                            primaryColor: Colors.white.withValues(alpha: 0.6),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "$humidity Humidité",
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Bloc Optimal Window (Bouton Néon)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "DEBUT OPTIMAL",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withValues(alpha: 0.4),
                          blurRadius: 12.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppIcon(
                          name: "clock",
                          size: 14.0,
                          primaryColor: Color(
                            0xFF131B24,
                          ), // Couleur sombre pour contraster
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          optimalTime,
                          style: const TextStyle(
                            color: Color(0xFF131B24),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- SOUS-WIDGET : Le Mini Score Circulaire ---
class _MiniCircularScore extends StatelessWidget {
  final int score;
  final Color color;

  const _MiniCircularScore({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55.0,
      height: 55.0,
      child: CustomPaint(
        painter: _MiniScorePainter(score: score, color: color),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
              const Text(
                "SCORE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniScorePainter extends CustomPainter {
  final int score;
  final Color color;

  _MiniScorePainter({required this.score, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 4.0;

    // Fond circulaire très sombre
    final bgPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, bgPaint);

    // Arc de progression
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;
    final sweepAngle = (score / 100).clamp(0.0, 1.0) * 2 * pi;

    // On dessine l'arc en l'insetant légèrement pour qu'il ne déborde pas
    final rect = Rect.fromCircle(
      center: center,
      radius: radius - strokeWidth / 2,
    );
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _MiniScorePainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.color != color;
  }
}
