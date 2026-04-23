// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enums.dart';

class ActivityTypeMapper extends EnumMapper<ActivityType> {
  ActivityTypeMapper._();

  static ActivityTypeMapper? _instance;
  static ActivityTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActivityTypeMapper._());
    }
    return _instance!;
  }

  static ActivityType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ActivityType decode(dynamic value) {
    switch (value) {
      case r'running':
        return ActivityType.running;
      case r'cycling':
        return ActivityType.cycling;
      case r'football':
        return ActivityType.football;
      case r'walking':
        return ActivityType.walking;
      case r'hikeOrTrekking':
        return ActivityType.hikeOrTrekking;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ActivityType self) {
    switch (self) {
      case ActivityType.running:
        return r'running';
      case ActivityType.cycling:
        return r'cycling';
      case ActivityType.football:
        return r'football';
      case ActivityType.walking:
        return r'walking';
      case ActivityType.hikeOrTrekking:
        return r'hikeOrTrekking';
    }
  }
}

extension ActivityTypeMapperExtension on ActivityType {
  String toValue() {
    ActivityTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ActivityType>(this) as String;
  }
}

class FitnessLevelMapper extends EnumMapper<FitnessLevel> {
  FitnessLevelMapper._();

  static FitnessLevelMapper? _instance;
  static FitnessLevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FitnessLevelMapper._());
    }
    return _instance!;
  }

  static FitnessLevel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FitnessLevel decode(dynamic value) {
    switch (value) {
      case r'beginner':
        return FitnessLevel.beginner;
      case r'intermediate':
        return FitnessLevel.intermediate;
      case r'advanced':
        return FitnessLevel.advanced;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FitnessLevel self) {
    switch (self) {
      case FitnessLevel.beginner:
        return r'beginner';
      case FitnessLevel.intermediate:
        return r'intermediate';
      case FitnessLevel.advanced:
        return r'advanced';
    }
  }
}

extension FitnessLevelMapperExtension on FitnessLevel {
  String toValue() {
    FitnessLevelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FitnessLevel>(this) as String;
  }
}

class HeatSensitivityMapper extends EnumMapper<HeatSensitivity> {
  HeatSensitivityMapper._();

  static HeatSensitivityMapper? _instance;
  static HeatSensitivityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HeatSensitivityMapper._());
    }
    return _instance!;
  }

  static HeatSensitivity fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  HeatSensitivity decode(dynamic value) {
    switch (value) {
      case r'low':
        return HeatSensitivity.low;
      case r'mid':
        return HeatSensitivity.mid;
      case r'high':
        return HeatSensitivity.high;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(HeatSensitivity self) {
    switch (self) {
      case HeatSensitivity.low:
        return r'low';
      case HeatSensitivity.mid:
        return r'mid';
      case HeatSensitivity.high:
        return r'high';
    }
  }
}

extension HeatSensitivityMapperExtension on HeatSensitivity {
  String toValue() {
    HeatSensitivityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<HeatSensitivity>(this) as String;
  }
}

