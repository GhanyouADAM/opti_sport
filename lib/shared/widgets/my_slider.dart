import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

// 1. --- LA CLASSE POUR LE CURSEUR PERSONNALISÉ ---
class CustomRangeSliderThumbShape extends RangeSliderThumbShape {
  final double enabledThumbRadius;
  final Color borderColor;
  final double borderWidth;
  final Color centerColor;

  const CustomRangeSliderThumbShape({
    this.enabledThumbRadius = 12.0, // Taille globale du curseur
    this.borderColor = const Color(0xFF00FFC4), // Vert fluo
    this.borderWidth = 3.5, // Épaisseur de l'anneau vert
    this.centerColor = const Color(
      0xFF121212,
    ), // Noir/Gris très foncé pour le centre
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(enabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;

    // Dessiner la bordure (l'anneau vert extérieur)
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, enabledThumbRadius, borderPaint);

    // Dessiner le centre (le cercle noir à l'intérieur)
    final Paint centerPaint = Paint()
      ..color = centerColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, enabledThumbRadius - borderWidth, centerPaint);
  }
}

// 2. --- LE WIDGET PRINCIPAL ---
class PreferredWindowSelector extends StatefulWidget {
  final ValueChanged<RangeValues> onChanged;
  const PreferredWindowSelector({super.key, required this.onChanged});
  @override
  State<PreferredWindowSelector> createState() =>
      _PreferredWindowSelectorState();
}

class _PreferredWindowSelectorState extends State<PreferredWindowSelector> {
  // Valeurs initiales (ex: de 05:00 à 09:30)
  RangeValues _currentRangeValues = const RangeValues(5.0, 9.5);

  // Fonction utilitaire pour convertir le double en format Heure (ex: 9.5 -> "09:30")
  String _formatTime(double value) {
    int hour = value.floor();
    int minute = ((value - hour) * 60).round();
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- En-tête avec le titre et les valeurs actuelles ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fenêtre de temps',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: context
                    .colorScheme
                    .surfaceContainer, // Fond vert foncé du badge
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${_formatTime(_currentRangeValues.start)}  -  ${_formatTime(_currentRangeValues.end)}',
                style: TextStyle(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Sélectionner l'intervalle de temps sur lequel vous souhaitez vous entrainer.",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 16),

        // --- Le Slider avec le Custom Thumb ---
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: context.colorScheme.primary, // Piste verte
            inactiveTrackColor: Colors.white.withValues(
              alpha: 0.1,
            ), // Piste sombre
            overlayColor: context.colorScheme.primary.withValues(
              alpha: 0.2,
            ), // Effet au clic
            trackHeight: 4.0,
            // UTILISATION DE LA CLASSE PERSONNALISÉE :
            rangeThumbShape: CustomRangeSliderThumbShape(
              enabledThumbRadius: 10.0,
              borderWidth: 3.0,
              centerColor: context.colorScheme.surfaceContainer,
              borderColor:
                  context.colorScheme.primary, // Assorti au fond de votre app
            ),
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: 4.0, // 04:00
            max: 20.0, // 20:00
            divisions: 32, // Crans toutes les 30 minutes
            onChanged: (values) {
              setState(() {
                _currentRangeValues = values;
              });
              widget.onChanged(values);
            },
          ),
        ),

        // --- Les labels Min/Max en dessous ---
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('04:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text('20:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
