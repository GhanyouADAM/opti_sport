import 'package:clima_run/core/constants/context_extension.dart';
import 'package:clima_run/features/home/models/recommendation.dart';
import 'package:clima_run/features/home/viewmodels/home_viewmodel.dart';
import 'package:clima_run/features/home/views/widgets/alert_card.dart';
import 'package:clima_run/features/home/views/widgets/my_chips.dart';
import 'package:clima_run/features/home/views/widgets/optimal_window.dart';
import 'package:clima_run/shared/providers/user_location_viewmodel.dart';
import 'package:clima_run/shared/widgets/custom_progress_indicator.dart';
import 'package:clima_run/shared/widgets/empty_state_widget.dart';
import 'package:clima_run/shared/widgets/error_widget.dart';
import 'package:clima_run/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendation = ref.watch(homeViewModelProvider);
    final userLocation = ref.watch(locationViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            userLocation.when(
              data: (location) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        'OptiSport',
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        location.shortAddress,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (e, s) => Text(
                'Erreur de postion',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              loading: () => Text(
                'Chargement...',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: recommendation.when(
          data: (recommendation) =>
              HomePageView(recommendation: recommendation),
          error: (e, s) => Center(
            child: OptiSportErrorWidget(
              title: "Une Erreur est survenu...",
              message: e.toString(),
            ),
          ),
          loading: () => Center(
            child: OptiSportLoadingIndicator(
              message: "Chargement des recommandations...",
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.recommendation});
  final Recommendation? recommendation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: recommendation == null
          ? OptiSportEmptyState(
              title: 'Pas de recommendations trouvées',
              message:
                  'Les conditions de cette journée sont inadéquates pour vous',
              iconName: 'ranking',
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        DateTime.now().toDashboardDateString,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      OptiSportAnimatedScore(
                        targetScore: recommendation!.score,
                        label: recommendation!.scoreLabel.name.toUpperCase(),
                      ),
                      SizedBox(height: 30),
                      OptiSportOptimalWindowCard(
                        startTime: recommendation!.bestStartHour.toTimeString,
                        endTime: recommendation!.bestEndHour.toTimeString,
                        title: "Créneau optimal ",
                        subtitle: "Pic de conditions idéales attendues",
                        period: "",
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          itemCount: recommendation!.reasons.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final reasons = recommendation!.reasons;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OptiSportConditionChip(
                                label: reasons[index],
                                iconName: recommendation!.iconName(
                                  reasons[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: recommendation!.warnings.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final warnings = recommendation!.warnings;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OptiSportAlertCard(
                                title: recommendation!.warningTitle(
                                  warnings[index],
                                ),
                                message: warnings[index],
                                iconName: "warning",
                              ),
                            );
                          },
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
