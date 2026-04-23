import 'package:clima_run/features/profile/views/widgets/sport_type_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/enums.dart';
import '../../../../shared/providers/core_providers.dart';

class OptiSportSportSelection extends StatefulWidget {
  const OptiSportSportSelection({super.key});

  @override
  State<OptiSportSportSelection> createState() =>
      _OptiSportSportSelectionState();
}

class _OptiSportSportSelectionState extends State<OptiSportSportSelection> {
  final _sportType = [
    (iconName: 'bicycle', label: 'Cyclisme', type: ActivityType.cycling),
    (
      iconName: 'person-simple-hike',
      label: 'Randonée',
      type: ActivityType.hikeOrTrekking,
    ),
    (
      iconName: 'person-simple-run',
      label: 'Course',
      type: ActivityType.running,
    ),
    (
      iconName: 'person-simple-walk',
      label: 'Marche',
      type: ActivityType.walking,
    ),
    (iconName: 'soccer-ball', label: 'Football', type: ActivityType.football),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _sportType.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final type = _sportType[index];
        return Consumer(
          builder: (context, ref, child) {
            final selectedSport = ref.watch(selectedSportProvider);
            return OptiSportSportTypeChip(
              iconName: type.iconName,
              label: type.label,
              isSelected: type.type == selectedSport,
              onTap: () {
                ref.read(selectedSportProvider.notifier).state = type.type;
              },
            );
          },
        );
      },
    );
  }
}
