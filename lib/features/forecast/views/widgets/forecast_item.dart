import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';
// N'oublie pas l'import de ton app_icon.dart
// import 'chemin/vers/app_icon.dart';

class OptiSportForecastListItem extends StatelessWidget {
  final String dayName;
  final String dayNumber;
  final String weatherIconName;
  final String weatherDescription;
  final String highTemp;
  final String lowTemp;
  final String bestSlotTime;
  final int score;

  const OptiSportForecastListItem({
    super.key,
    required this.dayName,
    required this.dayNumber,
    required this.weatherIconName,
    required this.weatherDescription,
    required this.highTemp,
    required this.lowTemp,
    required this.bestSlotTime,
    required this.score,
  });

  // Méthode pour déterminer la couleur du score automatiquement
  Color _getScoreColor(int score) {
    if (score >= 70) return const Color(0xFF00FFAA); // Cyan/Vert néon
    if (score >= 40) return const Color(0xFFFFB020); // Orange/Jaune
    return const Color(0xFFFF5252); // Rouge pour les mauvais scores
  }

  @override
  Widget build(BuildContext context) {
    final scoreColor = _getScoreColor(score);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2228), // Couleur de fond sombre de la carte
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // --- 1. GAUCHE : Date ---
          SizedBox(
            width: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  dayNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // --- 2. CENTRE : Météo ---
          Expanded(
            child: Row(
              children: [
                AppIcon(
                  name: weatherIconName,
                  size: 28.0,
                  // Si tu as des icônes SVG en couleur, tu peux enlever le primaryColor
                  primaryColor: Colors.white,
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        Text(
                          "$highTemp ",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          "/ $lowTemp",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.4),
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- 3. DROITE : Best Slot & Score ---
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DEBUTER À",
                    style: TextStyle(
                      color:
                          scoreColor, // Le texte prend la couleur du score pour plus d'harmonie
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    bestSlotTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12.0),
              // Le mini cercle de score pour la liste
              _ListScoreIndicator(score: score, color: scoreColor),
            ],
          ),
        ],
      ),
    );
  }
}

// --- SOUS-WIDGET : Mini cercle de score pour la liste ---
class _ListScoreIndicator extends StatelessWidget {
  final int score;
  final Color color;

  const _ListScoreIndicator({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: CustomPaint(
        painter: _ListScorePainter(score: score, color: color),
        child: Center(
          child: Text(
            score.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _ListScorePainter extends CustomPainter {
  final int score;
  final Color color;

  _ListScorePainter({required this.score, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 3.0; // Un peu plus fin que celui de la carte principale

    // Cercle de fond discret
    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius - strokeWidth / 2, bgPaint);

    // Arc de progression
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;
    final sweepAngle = (score / 100).clamp(0.0, 1.0) * 2 * pi;

    final rect = Rect.fromCircle(
      center: center,
      radius: radius - strokeWidth / 2,
    );
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _ListScorePainter oldDelegate) {
    return oldDelegate.score != score || oldDelegate.color != color;
  }
}
