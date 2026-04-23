import 'package:clima_run/core/constants/app_icon.dart';
import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

class OptiSportSportTypeChip extends StatelessWidget {
  const OptiSportSportTypeChip({
    super.key,
    required this.iconName,
    this.isSelected = false,
    required this.label,
    required this.onTap,
  });
  final String iconName;
  final bool isSelected;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colorScheme.primary.withValues(alpha: .3)
              : context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              AppIcon(
                name: iconName,
                primaryColor: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
              ),
              Text(
                label,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
