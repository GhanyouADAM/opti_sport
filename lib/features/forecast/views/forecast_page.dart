import 'package:clima_run/features/forecast/viewmodels/featured_forecast_item_provider.dart';
import 'package:clima_run/features/forecast/viewmodels/forecast_viewmodel.dart';
import 'package:clima_run/features/forecast/views/widgets/forecast_item.dart';
import 'package:clima_run/features/forecast/views/widgets/forecast_optimal_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_icon.dart';
import '../../../core/constants/context_extension.dart';
import '../../../shared/providers/user_location_viewmodel.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../models/forecast_day.dart';

class ForecastPage extends ConsumerStatefulWidget {
  const ForecastPage({super.key});

  @override
  ConsumerState createState() => _ForecastPageState();
}

class _ForecastPageState extends ConsumerState<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    final forecastDays = ref.watch(forecastViewModelProvider);
    final location = ref.watch(locationViewModelProvider);
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: forecastDays.when(
              data: (data) => ForecastView(forecastDays: data),
              error: (error, S) {
                return OptiSportErrorWidget(
                  title: "Erreur",
                  message: error.toString().replaceAll("Exception: ", ""),
                  iconName: "warning",
                );
              },
              loading: () => OptiSportLoadingIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class ForecastView extends ConsumerWidget {
  const ForecastView({super.key, required this.forecastDays});
  final List<ForecastDay> forecastDays;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredForecastModel = ref.watch(featuredForecastProvider);
    return Column(
      children: [
        featuredForecastModel.when(
          loading: () => const OptiSportLoadingIndicator(),
          error: (err, stack) => OptiSportErrorWidget(message: err.toString()),
          data: (uiModel) {
            final forecast = uiModel.forecast;
            return OptiSportFeaturedForecastCard(
              dateLabel: forecast.date.toShortDateString,
              highTemp: forecast.maxTemperature.toDegree,
              lowTemp: forecast.minTemperature.toDegree,
              humidity: "${forecast.bestSlot.humidity}%",
              score: forecast.bestSlot.score,
              optimalTime: forecast.bestSlot.hour.toTimeString,
              weatherIconName: forecast.dominantWeatherCode.weatherIconName,
              description: forecast.dominantWeatherCode.weatherDescription,
            );
          },
        ),
        SizedBox(height: 30),
        ListView.builder(
          itemCount: forecastDays.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final dayInfo = forecastDays[index];
            return OptiSportForecastListItem(
              dayName: dayInfo.date.toDateDayName,
              dayNumber: dayInfo.date.day.toString(),
              weatherIconName: dayInfo.dominantWeatherCode.weatherIconName,
              weatherDescription:
                  dayInfo.dominantWeatherCode.weatherDescription,
              highTemp: dayInfo.maxTemperature.toDegree,
              lowTemp: dayInfo.minTemperature.toDegree,
              bestSlotTime: dayInfo.bestSlot.hour.toTimeString,
              score: dayInfo.bestSlot.score,
            );
          },
        ),
      ],
    );
  }
}
