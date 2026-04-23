// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_profile.dart';

class UserProfileMapper extends ClassMapperBase<UserProfile> {
  UserProfileMapper._();

  static UserProfileMapper? _instance;
  static UserProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserProfileMapper._());
      ActivityTypeMapper.ensureInitialized();
      FitnessLevelMapper.ensureInitialized();
      HeatSensitivityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserProfile';

  static int? _$id(UserProfile v) => v.id;
  static const Field<UserProfile, int> _f$id = Field('id', _$id, opt: true);
  static String _$userId(UserProfile v) => v.userId;
  static const Field<UserProfile, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
  );
  static ActivityType _$activityType(UserProfile v) => v.activityType;
  static const Field<UserProfile, ActivityType> _f$activityType = Field(
    'activityType',
    _$activityType,
    key: r'activity_type',
  );
  static FitnessLevel _$fitnessLevel(UserProfile v) => v.fitnessLevel;
  static const Field<UserProfile, FitnessLevel> _f$fitnessLevel = Field(
    'fitnessLevel',
    _$fitnessLevel,
    key: r'fitness_level',
  );
  static int _$preferredStartHour(UserProfile v) => v.preferredStartHour;
  static const Field<UserProfile, int> _f$preferredStartHour = Field(
    'preferredStartHour',
    _$preferredStartHour,
    key: r'preferred_start_hour',
  );
  static int _$preferredEndHour(UserProfile v) => v.preferredEndHour;
  static const Field<UserProfile, int> _f$preferredEndHour = Field(
    'preferredEndHour',
    _$preferredEndHour,
    key: r'preferred_end_hour',
  );
  static HeatSensitivity _$heatSensitivity(UserProfile v) => v.heatSensitivity;
  static const Field<UserProfile, HeatSensitivity> _f$heatSensitivity = Field(
    'heatSensitivity',
    _$heatSensitivity,
    key: r'heat_sensitivity',
  );
  static DateTime _$updatedAt(UserProfile v) => v.updatedAt;
  static const Field<UserProfile, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );

  @override
  final MappableFields<UserProfile> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #activityType: _f$activityType,
    #fitnessLevel: _f$fitnessLevel,
    #preferredStartHour: _f$preferredStartHour,
    #preferredEndHour: _f$preferredEndHour,
    #heatSensitivity: _f$heatSensitivity,
    #updatedAt: _f$updatedAt,
  };

  static UserProfile _instantiate(DecodingData data) {
    return UserProfile(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      activityType: data.dec(_f$activityType),
      fitnessLevel: data.dec(_f$fitnessLevel),
      preferredStartHour: data.dec(_f$preferredStartHour),
      preferredEndHour: data.dec(_f$preferredEndHour),
      heatSensitivity: data.dec(_f$heatSensitivity),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserProfile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserProfile>(map);
  }

  static UserProfile fromJson(String json) {
    return ensureInitialized().decodeJson<UserProfile>(json);
  }
}

mixin UserProfileMappable {
  String toJson() {
    return UserProfileMapper.ensureInitialized().encodeJson<UserProfile>(
      this as UserProfile,
    );
  }

  Map<String, dynamic> toMap() {
    return UserProfileMapper.ensureInitialized().encodeMap<UserProfile>(
      this as UserProfile,
    );
  }

  UserProfileCopyWith<UserProfile, UserProfile, UserProfile> get copyWith =>
      _UserProfileCopyWithImpl<UserProfile, UserProfile>(
        this as UserProfile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserProfileMapper.ensureInitialized().stringifyValue(
      this as UserProfile,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserProfileMapper.ensureInitialized().equalsValue(
      this as UserProfile,
      other,
    );
  }

  @override
  int get hashCode {
    return UserProfileMapper.ensureInitialized().hashValue(this as UserProfile);
  }
}

extension UserProfileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserProfile, $Out> {
  UserProfileCopyWith<$R, UserProfile, $Out> get $asUserProfile =>
      $base.as((v, t, t2) => _UserProfileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserProfileCopyWith<$R, $In extends UserProfile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? userId,
    ActivityType? activityType,
    FitnessLevel? fitnessLevel,
    int? preferredStartHour,
    int? preferredEndHour,
    HeatSensitivity? heatSensitivity,
    DateTime? updatedAt,
  });
  UserProfileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserProfileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserProfile, $Out>
    implements UserProfileCopyWith<$R, UserProfile, $Out> {
  _UserProfileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserProfile> $mapper =
      UserProfileMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    String? userId,
    ActivityType? activityType,
    FitnessLevel? fitnessLevel,
    int? preferredStartHour,
    int? preferredEndHour,
    HeatSensitivity? heatSensitivity,
    DateTime? updatedAt,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (userId != null) #userId: userId,
      if (activityType != null) #activityType: activityType,
      if (fitnessLevel != null) #fitnessLevel: fitnessLevel,
      if (preferredStartHour != null) #preferredStartHour: preferredStartHour,
      if (preferredEndHour != null) #preferredEndHour: preferredEndHour,
      if (heatSensitivity != null) #heatSensitivity: heatSensitivity,
      if (updatedAt != null) #updatedAt: updatedAt,
    }),
  );
  @override
  UserProfile $make(CopyWithData data) => UserProfile(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    activityType: data.get(#activityType, or: $value.activityType),
    fitnessLevel: data.get(#fitnessLevel, or: $value.fitnessLevel),
    preferredStartHour: data.get(
      #preferredStartHour,
      or: $value.preferredStartHour,
    ),
    preferredEndHour: data.get(#preferredEndHour, or: $value.preferredEndHour),
    heatSensitivity: data.get(#heatSensitivity, or: $value.heatSensitivity),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  UserProfileCopyWith<$R2, UserProfile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserProfileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

