import 'package:clima_run/features/forecast/models/forecast_day.dart';
import 'package:clima_run/features/home/models/recommendation.dart';

class ForecastFeaturedModel {
  final Recommendation recommendation;
  final ForecastDay forecast;
  ForecastFeaturedModel(this.recommendation, this.forecast);
}
