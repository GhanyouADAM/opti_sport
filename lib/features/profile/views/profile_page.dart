import 'package:clima_run/core/constants/context_extension.dart';
import 'package:clima_run/core/constants/enums.dart';
import 'package:clima_run/features/authentication/viewmodels/auth_viewmodel.dart';
import 'package:clima_run/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:clima_run/features/profile/views/widgets/profil_avatar.dart';
import 'package:clima_run/features/profile/views/widgets/section_tile.dart';
import 'package:clima_run/features/profile/views/widgets/segmented_control.dart';
import 'package:clima_run/features/profile/views/widgets/selectable_chip.dart';
import 'package:clima_run/features/profile/views/widgets/sport_selection_grid.dart';
import 'package:clima_run/shared/providers/core_providers.dart';
import 'package:clima_run/shared/providers/user_location_viewmodel.dart';
import 'package:clima_run/shared/widgets/alert_dialog.dart';
import 'package:clima_run/shared/widgets/error_widget.dart';
import 'package:clima_run/shared/widgets/loading_widget.dart';
import 'package:clima_run/shared/widgets/my_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/user_profile.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: profile.when(
        data: (data) {
          return data == null
              ? const Center(child: Text('Aucun profil trouvé'))
              : SingleChildScrollView(child: ProfileView(profile: data));
        },
        error: (e, s) =>
            Center(child: OptiSportErrorWidget(message: e.toString())),
        loading: () => Center(child: const OptiSportLoadingIndicator()),
      ),
    );
  }
}

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key, required this.profile});
  final UserProfile profile;

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectedSportProvider.notifier).state =
          widget.profile.activityType;
      ref.read(selectedLevelProvider.notifier).state =
          widget.profile.fitnessLevel;
      ref.read(selectHeatLevelProvider.notifier).state =
          widget.profile.heatSensitivity;
      ref.read(selectedRangeValueProvider.notifier).state = RangeValues(
        widget.profile.preferredStartHour.toDouble(),
        widget.profile.preferredEndHour.toDouble(),
      );
    });
  }

  bool _hasChanges() {
    final currentSport = ref.watch(selectedSportProvider);
    final currentLevel = ref.watch(selectedLevelProvider);
    final currentHeatLevel = ref.watch(selectHeatLevelProvider);
    final currentRange = ref.watch(selectedRangeValueProvider);
    return currentSport != widget.profile.activityType ||
        currentLevel != widget.profile.fitnessLevel ||
        currentHeatLevel != widget.profile.heatSensitivity ||
        currentRange.start != widget.profile.preferredStartHour ||
        currentRange.end != widget.profile.preferredEndHour;
  }

  final _heatLevels = [
    (level: "Sensible", name: "thermometer-cold", type: HeatSensitivity.low),
    (
      level: 'Modérément',
      name: "thermometer-simple",
      type: HeatSensitivity.mid,
    ),
    (level: 'Peu', name: "thermometer-hot", type: HeatSensitivity.high),
  ];
  void submit() async {
    final profile = widget.profile.copyWith(
      activityType: ref.read(selectedSportProvider),
      fitnessLevel: ref.read(selectedLevelProvider),
      heatSensitivity: ref.read(selectHeatLevelProvider),
      preferredStartHour: ref.read(selectedRangeValueProvider).start.toInt(),
      preferredEndHour: ref.read(selectedRangeValueProvider).end.toInt(),
    );
    await ref.read(profileViewModelProvider.notifier).saveProfile(profile);
  }

  void deconnexion() {
    showDialog(
      context: context,
      builder: (ctx) => CustomAlertDialog(
        title: 'Se deconnecter',
        content: 'Êtes-vous sûr de vouloir vous déconnecter ?',
        primaryButtonText: 'Deconnexion',
        secondaryButtonText: 'Annuler',
        onPrimaryPressed: () {
          ref.read(authViewModelProvider.notifier).signOut();
        },
        onSecondaryPressed: () {
          ctx.pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _hasChanges();
    final location = ref.watch(locationViewModelProvider);
    final isLoading = ref.watch(profileViewModelProvider).isLoading;
    final mail = ref.watch(userEmailProvider);
    ref.listen(profileViewModelProvider, (previous, next) {
      if (previous?.isLoading == true && next.hasValue && !next.hasError) {
        if (next.value != null) {
          showDialog(
            context: context,
            builder: (ctx) => CustomAlertDialog(
              title: 'Mis a jour',
              content: 'Profil mis a jour avec succès',
              primaryButtonText: 'compris',
              onPrimaryPressed: () {
                ctx.pop();
              },
            ),
          );
        }
        if (next.hasError && !next.isLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      }
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            OptiSportProfileAvatar(onEditTap: () {}),
            const SizedBox(height: 10),
            Text(
              mail,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onSurface,
              ),
            ),
            location.when(
              data: (data) {
                return Text(
                  data.shortAddress,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                );
              },
              error: (e, s) => Text(
                'Location inconnue',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              loading: () => Text(
                'chargement',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 45),
            OptiSportSectionTitle(
              title: "Activité principale",
              iconName: 'person-simple-run',
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(height: 20),
            OptiSportSportSelection(),
            const SizedBox(height: 45),
            OptiSportSectionTitle(
              title: "Niveau d'activité sportive",
              iconName: 'ranking',
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(height: 20),
            OptiSportSegmentedControl<FitnessLevel>(
              options: {
                FitnessLevel.beginner: 'Débutant',
                FitnessLevel.intermediate: 'Intermédiaire',
                FitnessLevel.advanced: 'Avancé',
              },
              selectedValue:
                  ref.watch(selectedLevelProvider) ??
                  widget.profile.fitnessLevel,
              onValueChanged: (value) {
                ref.read(selectedLevelProvider.notifier).state = value;
              },
            ),
            const SizedBox(height: 30),
            PreferredWindowSelector(
              onChanged: (values) {
                ref.read(selectedRangeValueProvider.notifier).state = values;
              },
            ),
            const SizedBox(height: 45),
            OptiSportSectionTitle(
              title: 'Tolérance a la chaleur',
              iconName: 'thermometer-simple',
              color: context.colorScheme.onSurface,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: HeatSensitivity.values.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OptiSportSelectableChip(
                      label: _heatLevels[index].level,
                      isSelected:
                          ref.watch(selectHeatLevelProvider) ==
                          HeatSensitivity.values[index],
                      onTap: () {
                        ref.read(selectHeatLevelProvider.notifier).state =
                            HeatSensitivity.values[index];
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            isEditing
                ? SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: isLoading ? null : submit,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: context.colorScheme.primary.withValues(
                                alpha: .7,
                              ),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: context.colorScheme.onPrimary,
                                )
                              : Text(
                                  "Valider",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onPrimary,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            const SizedBox(height: 30),

            GestureDetector(
              onTap: deconnexion,
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: context.colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Se deconnecter',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
