import 'package:flutter/material.dart';

class OptiSportSelectableChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const OptiSportSelectableChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF00FFAA);
    const Color inactiveColor = Color(0xFF1E2228);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.15)
              : inactiveColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected
                ? accentColor
                : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? accentColor
                : Colors.white.withValues(alpha: 0.7),
            fontSize: 13.0,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
