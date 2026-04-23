import 'package:clima_run/core/constants/enums.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_profile.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class UserProfile with UserProfileMappable {
  final int? id;
  @MappableField(key: 'user_id')
  final String userId;
  final ActivityType activityType;
  final FitnessLevel fitnessLevel;
  final int preferredStartHour;
  final int preferredEndHour;
  final HeatSensitivity heatSensitivity;
  final DateTime updatedAt;

  UserProfile({
    this.id,
    required this.userId,
    required this.activityType,
    required this.fitnessLevel,
    required this.preferredStartHour,
    required this.preferredEndHour,
    required this.heatSensitivity,
    required this.updatedAt,
  });
}
