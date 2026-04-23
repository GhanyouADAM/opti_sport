import 'package:clima_run/core/constants/app_icon.dart';
import 'package:clima_run/core/constants/context_extension.dart';
import 'package:clima_run/features/home/viewmodels/home_viewmodel.dart';
import 'package:clima_run/features/timeline/viewmodels/timeline_viewmodel.dart';
import 'package:clima_run/features/timeline/views/widgets/timeline_item.dart';
import 'package:clima_run/features/timeline/views/widgets/timeline_optimal_window.dart';
import 'package:clima_run/shared/providers/user_location_viewmodel.dart';
import 'package:clima_run/shared/widgets/empty_state_widget.dart';
import 'package:clima_run/shared/widgets/error_widget.dart';
import 'package:clima_run/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hourly_slot.dart';

class TimelinePage extends ConsumerStatefulWidget {
  const TimelinePage({super.key});

  @override
  ConsumerState createState() => _TimelinePageState();
}

class _TimelinePageState extends ConsumerState<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationViewModelProvider);
    final hourlySlots = ref.watch(timelineViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: location.when(
          data: (location) => Row(
            children: [
              AppIcon(
                name: 'map-pin-line',
                primaryColor: context.colorScheme.primary,
              ),
              const SizedBox(width: 3),
              Text(location.shortAddress),
            ],
          ),
          error: (e, s) => Text('Erreur de localisation'),
          loading: () => Text('chargement...'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: hourlySlots.when(
              data: (hourlySlots) {
                if (hourlySlots.isEmpty) {
                  return OptiSportEmptyState(
                    title: 'Crenaux',
                    message: "Aucun créneaux trouvé",
                    iconName: "warning",
                  );
                }
                return TimeLineView(hourlySlots: hourlySlots);
              },
              error: (e, s) => OptiSportErrorWidget(),
              loading: () => OptiSportLoadingIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLineView extends ConsumerWidget {
  const TimeLineView({super.key, required this.hourlySlots});
  final List<HourlySlot> hourlySlots;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommandation = ref.watch(homeViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          recommandation.when(
            data: (recommandation) => recommandation == null
                ? OptiSportEmptyState(
                    title: 'Recommendation',
                    message: "Aucun créneau trouvé",
                    iconName: 'warning',
                  )
                : OptiSportDailyOptimalWindow(
                    accentColor: context.colorScheme.primary,
                    timeRange:
                        '${recommandation.bestStartHour.toTimeString} - ${recommandation.bestEndHour.toTimeString}',
                    temperature: recommandation
                        .averageTemp(hourlySlots)
                        .toCelsius,
                  ),
            error: (e, s) => OptiSportErrorWidget(),
            loading: () => OptiSportLoadingIndicator(),
          ),
          SizedBox(height: 30),
          ListView.builder(
            itemCount: hourlySlots.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final slot = hourlySlots[index];
              return OptiSportTimelineItem(
                time: slot.hour.toTimeString,
                period: slot.hour.hour < 12 ? 'AM' : 'PM',
                temperature: slot.temperature.toCelsius,
                humidity: "${slot.humidity}%",
                uvIndex: "UV ${slot.uvIndex}",
                windSpeed: "${slot.windSpeed}km",
                intensityLevel: slot.score / 100,
                intensityColor: slot.intensityColor,
                isRecommended: slot.isRecommended,
              );
            },
          ),
        ],
      ),
    );
  }
}
