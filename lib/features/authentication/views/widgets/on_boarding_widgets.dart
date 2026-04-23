import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_icon.dart';
import '../../../../core/constants/context_extension.dart';
import '../../../../core/constants/enums.dart';
import '../../../../shared/providers/core_providers.dart';

class HeatLevelSelection extends StatefulWidget {
  const HeatLevelSelection({super.key});

  @override
  State<HeatLevelSelection> createState() => _HeatLevelSelectionState();
}

class _HeatLevelSelectionState extends State<HeatLevelSelection> {
  int? _selectedIndex;
  final _heatLevels = [
    (
      level: "Très sensible",
      name: "thermometer-cold",
      type: HeatSensitivity.low,
    ),
    (
      level: 'Modérément sensible',
      name: "thermometer-simple",
      type: HeatSensitivity.mid,
    ),
    (
      level: 'Peu Sensible',
      name: "thermometer-hot",
      type: HeatSensitivity.high,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _heatLevels.length,
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                ref.read(selectHeatLevelProvider.notifier).state =
                    _heatLevels[index].type;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeatLevelTile(
                  level: _heatLevels[index].level,
                  name: _heatLevels[index].name,
                  isSelected: _selectedIndex == index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class HeatLevelTile extends StatelessWidget {
  const HeatLevelTile({
    super.key,
    this.isSelected = false,
    required this.level,
    required this.name,
  });
  final bool isSelected;
  final String level;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary.withValues(alpha: .3)
            : context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
          width: isSelected ? 3 : .1,
        ),
      ),
      child: Row(
        children: [
          AppIcon(
            name: name,
            primaryColor: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 10),
          Text(
            level,
            style: context.textTheme.bodyLarge!.copyWith(
              color: isSelected
                  ? context.colorScheme.onSurface
                  : context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class FitnessLevelSelection extends StatefulWidget {
  const FitnessLevelSelection({super.key});

  @override
  State<FitnessLevelSelection> createState() => _FitnessLevelSelectionState();
}

class _FitnessLevelSelectionState extends State<FitnessLevelSelection> {
  int? _selectedIndex;
  final _fitnessLevel = [
    (
      name: 'sneaker',
      level: 'Débutant',
      levelDescription: 'Vous débutez ou pratiquer peu de sport',
      type: FitnessLevel.beginner,
    ),
    (
      name: 'sneaker-move',
      level: 'Intermédiaire',
      levelDescription: 'Vous vous entrainez régulierement',
      type: FitnessLevel.intermediate,
    ),
    (
      name: 'ranking',
      level: 'Avancée',
      levelDescription: 'Niveau athlète, haute intensité',
      type: FitnessLevel.advanced,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _fitnessLevel.length,
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                ref.read(selectedLevelProvider.notifier).state =
                    _fitnessLevel[index].type;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FitnessCard(
                  level: _fitnessLevel[index].level,
                  levelDescription: _fitnessLevel[index].levelDescription,
                  isSelected: _selectedIndex == index,
                  name: _fitnessLevel[index].name,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class FitnessCard extends StatelessWidget {
  const FitnessCard({
    super.key,
    this.isSelected = false,
    required this.level,
    required this.levelDescription,
    required this.name,
  });
  final bool isSelected;
  final String level;
  final String levelDescription;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 70,
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary.withValues(alpha: .3)
            : context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
          width: isSelected ? 3 : .1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colorScheme.onSurfaceVariant.withValues(
              alpha: .1,
            ),
            child: AppIcon(
              name: name,
              primaryColor: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
              size: 30,
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                level,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: isSelected
                      ? context.colorScheme.onSurface
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                levelDescription,
                style: context.textTheme.bodySmall!.copyWith(
                  color: isSelected
                      ? context.colorScheme.onSurface
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SportTypeSelection extends StatefulWidget {
  const SportTypeSelection({super.key});

  @override
  State<SportTypeSelection> createState() => _SportTypeSelectionState();
}

class _SportTypeSelectionState extends State<SportTypeSelection> {
  int? _selectedIndex;
  final _sportTypes = [
    (name: 'bicycle', sportName: 'Cyclisme', type: ActivityType.cycling),
    (
      name: 'person-simple-hike',
      sportName: 'Randonée',
      type: ActivityType.hikeOrTrekking,
    ),
    (
      name: 'person-simple-run',
      sportName: 'Course',
      type: ActivityType.running,
    ),
    (
      name: 'person-simple-walk',
      sportName: 'Marche',
      type: ActivityType.walking,
    ),
    (name: 'soccer-ball', sportName: 'Football', type: ActivityType.football),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        childAspectRatio: 1.5,
        crossAxisCount: 2,
      ),
      itemCount: _sportTypes.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                ref.read(selectedSportProvider.notifier).state =
                    _sportTypes[index].type;
              },
              child: SportCard(
                name: _sportTypes[index].name,
                sportName: _sportTypes[index].sportName,
                isSelected: _selectedIndex == index,
              ),
            );
          },
        );
      },
    );
  }
}

class SportCard extends StatelessWidget {
  const SportCard({
    super.key,
    required this.name,
    required this.sportName,
    this.isSelected = false,
  });
  final String name;
  final String sportName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary.withValues(alpha: .3)
            : context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
          width: isSelected ? 3 : .1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(
            name: name,
            primaryColor: !isSelected
                ? context.colorScheme.onSurfaceVariant
                : context.colorScheme.primary,
            size: 35,
          ),
          SizedBox(height: 8),
          Text(
            sportName,
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
