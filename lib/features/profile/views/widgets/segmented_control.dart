import 'package:flutter/material.dart';

class OptiSportSegmentedControl<T> extends StatelessWidget {
  final Map<T, String>
  options; // Les valeurs (ex: ActivityType.running) et leurs labels ("Running")
  final T selectedValue;
  final ValueChanged<T> onValueChanged;

  const OptiSportSegmentedControl({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF00FFAA);
    const Color bgColor = Color(0xFF1E2228);

    return Container(
      padding: const EdgeInsets.all(4.0), // Marge interne
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30.0), // Pilule globale
      ),
      child: Row(
        children: options.entries.map((entry) {
          final isSelected = entry.key == selectedValue;

          return Expanded(
            child: GestureDetector(
              onTap: () => onValueChanged(entry.key),
              // AnimatedContainer donne une transition douce au clic
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  color: isSelected ? accentColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(26.0),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: accentColor.withValues(alpha: 0.3),
                            blurRadius: 8.0,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  entry.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // Texte sombre si sélectionné, blanc sinon
                    color: isSelected ? const Color(0xFF0B101A) : Colors.white,
                    fontSize: 14.0,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
