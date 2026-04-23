import 'package:clima_run/core/constants/context_extension.dart';
import 'package:clima_run/features/authentication/views/widgets/on_boarding_widgets.dart';
import 'package:clima_run/features/profile/models/user_profile.dart';
import 'package:clima_run/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:clima_run/shared/widgets/my_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/providers/core_providers.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({super.key});

  @override
  ConsumerState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  bool _isSubmitting = false;
  RangeValues _selectedRange = const RangeValues(5.0, 9.5);

  void _onSubmit() async {
    final activityType = ref.read(selectedSportProvider);
    final fitnessLevel = ref.read(selectedLevelProvider);
    final heatSensitivity = ref.read(selectHeatLevelProvider);
    if (_isSubmitting) return;
    setState(() {
      _isSubmitting = true;
    });
    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;
      final profile = UserProfile(
        userId: userId,
        activityType: activityType,
        fitnessLevel: fitnessLevel,
        preferredStartHour: _selectedRange.start.toInt(),
        preferredEndHour: _selectedRange.end.toInt(),
        heatSensitivity: heatSensitivity,
        updatedAt: DateTime.now(),
      );
      await ref.read(profileViewModelProvider.notifier).saveProfile(profile);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 30),
            content: Text(e.toString()),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Text(
                  'Quelle est votre activité sportive principale ?',
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Sélectionnez l\'activité sportive que vous patiquer le plus souvent pour que nous personnalisons vos recommendations',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 30),
                //<-------------- type de sport ---------------->
                const SportTypeSelection(),
                const SizedBox(height: 30),
                //<--------------- level de fitness ------------->
                Text(
                  'Quel est votre niveau d\'activité sportive ?',
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 15),
                const FitnessLevelSelection(),
                const SizedBox(height: 30),
                //<-------------- heure d'entrainement ------------->
                Text(
                  "Quelle est votre heure d'entrainement ?",
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 15),
                PreferredWindowSelector(
                  onChanged: (values) {
                    setState(() {
                      _selectedRange = values;
                    });
                  },
                ),
                const SizedBox(height: 30),
                //<-------------- sensibilite a la chaleur ------------>
                Text(
                  'Quel est votre tolérance a la chaleur',
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Peu sensible = Supporte bien la chaleur et peut s'entrainer au dela de 30°C sans problème particulier.",
                ),
                Text(
                  "Modérément sensible = La Chaleur vous fatigue plus vite, préfère eviter les crénaux chaud.",
                ),
                Text(
                  "Très sensible = Ressens rapidement l'effet de la chaleur, préfère les crénaux frais.",
                ),
                const SizedBox(height: 15),
                SizedBox(height: 65, child: HeatLevelSelection()),
                const SizedBox(height: 30),
                //<-------------- bouton de validation ------------>
                InkWell(
                  onTap: _onSubmit,
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
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: _isSubmitting
                          ? CircularProgressIndicator(
                              color: context.colorScheme.onPrimary,
                            )
                          : Text(
                              "Valider",
                              style: TextStyle(
                                color: context.colorScheme.onPrimary,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
