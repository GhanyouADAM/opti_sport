import 'package:clima_run/features/forecast/models/forecast_featured_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/viewmodels/home_viewmodel.dart';
import 'forecast_viewmodel.dart';

// Ce provider "écoute" les deux autres et fusionne leurs données
final featuredForecastProvider = FutureProvider<ForecastFeaturedModel>((
  ref,
) async {
  // On attend que les deux viewmodels aient fini de charger leurs données
  // (L'utilisation de .wait permet de charger les deux en parallèle !)
  final (forecastList, recommendation) = await (
    ref.watch(forecastViewModelProvider.future),
    ref.watch(homeViewModelProvider.future),
  ).wait;

  if (forecastList.isEmpty || recommendation == null) {
    throw Exception("Données insuffisantes pour aujourd'hui");
  }

  // On prend le premier jour de la liste (qui est censé être aujourd'hui)
  final todayForecast = forecastList.first;

  return ForecastFeaturedModel(recommendation, todayForecast);
});
