import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/context_extension.dart';

class OptiSportAnimatedScore extends StatelessWidget {
  final int targetScore;
  final String label;
  final Color color;
  final double size;
  final double strokeWidth;
  final Duration duration;

  const OptiSportAnimatedScore({
    super.key,
    required this.targetScore,
    required this.label,
    this.color = const Color(0xFF00FFAA), // Couleur néon par défaut
    this.size = 250.0,
    this.strokeWidth = 12.0,
    this.duration = const Duration(
      milliseconds: 1500,
    ), // Durée de l'animation : 1.5s
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      // Le TweenAnimationBuilder gère l'animation de 0 jusqu'au score cible
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: targetScore.toDouble()),
        duration: duration,
        curve: Curves.easeOutCubic, // La courbe permet de ralentir à la fin
        builder: (context, animatedValue, child) {
          return CustomPaint(
            painter: _ScorePainter(
              score: animatedValue, // On passe la valeur animée au dessinateur
              color: color,
              strokeWidth: strokeWidth,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    // On convertit le double animé en entier pour l'affichage
                    animatedValue.toInt().toString(),
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ScorePainter extends CustomPainter {
  final double score; // Maintenant un double pour la fluidité de l'animation
  final Color color;
  final double strokeWidth;

  _ScorePainter({
    required this.score,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth * 3) / 2;

    // 1. Anneau de fond
    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    // 2. Calcul des angles
    const startAngle = -pi / 2;
    final percentage = (score / 100).clamp(0.0, 1.0);
    final sweepAngle = percentage * 2 * pi;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // On ne dessine la barre et le point que si le score est supérieur à 0
    // (pour éviter un bug visuel à la toute première frame de l'animation)
    if (sweepAngle > 0) {
      // 3. Effet "Néon"
      final glowPaint = Paint()
        ..color = color.withValues(alpha: 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

      canvas.drawArc(rect, startAngle, sweepAngle, false, glowPaint);

      // 4. Arc principal
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);

      // 5. Point indicateur
      final dotAngle = startAngle + sweepAngle + 0.15;
      final dotX = center.dx + radius * cos(dotAngle);
      final dotY = center.dy + radius * sin(dotAngle);

      final dotPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(dotX, dotY), strokeWidth / 2.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ScorePainter oldDelegate) {
    // Redessine à chaque frame où le score animé change
    return oldDelegate.score != score ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
