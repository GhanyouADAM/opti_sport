import 'dart:math';

import 'package:flutter/material.dart';

class OptiSportLoadingIndicator extends StatefulWidget {
  final double size;
  final Color color;
  final String?
  message; // Message optionnel en dessous ("Loading...", "Fetching data...")

  const OptiSportLoadingIndicator({
    super.key,
    this.size = 60.0,
    this.color = const Color(0xFF00FFAA), // Vert néon par défaut
    this.message,
  });

  @override
  State<OptiSportLoadingIndicator> createState() =>
      _OptiSportLoadingIndicatorState();
}

class _OptiSportLoadingIndicatorState extends State<OptiSportLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // L'animation tourne en boucle indéfiniment
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          // RotationTransition fait tourner le CustomPainter
          child: RotationTransition(
            turns: _controller,
            child: CustomPaint(
              painter: _NeonSpinnerPainter(color: widget.color),
            ),
          ),
        ),
        if (widget.message != null) ...[
          const SizedBox(height: 16.0),
          Text(
            widget.message!,
            style: TextStyle(
              color: widget.color.withValues(alpha: 0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ],
    );
  }
}

class _NeonSpinnerPainter extends CustomPainter {
  final Color color;

  _NeonSpinnerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4.0;
    const strokeWidth = 4.0;

    // 1. Cercle de fond très discret
    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    // 2. L'arc lumineux (Glow)
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8); // Effet néon

    // 3. L'arc principal (Solide)
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // On dessine un arc qui prend environ 70% du cercle
    const sweepAngle = 1.4 * pi;

    canvas.drawArc(rect, 0.0, sweepAngle, false, glowPaint);
    canvas.drawArc(rect, 0.0, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _NeonSpinnerPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
