import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';

class OptiSportSectionTitle extends StatelessWidget {
  final String title;
  final String iconName;
  final Color color;

  const OptiSportSectionTitle({
    super.key,
    required this.title,
    required this.iconName,
    this.color = const Color(0xFF8E94A3), // Le gris bleuté de tes maquettes
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcon(
          name: iconName,
          size: 18.0,
          primaryColor: context.colorScheme.primary,
        ),
        const SizedBox(width: 8.0),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2, // Donne cet aspect "Label technique"
          ),
        ),
      ],
    );
  }
}
