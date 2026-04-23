// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'recommendation.dart';

class RecommendationMapper extends ClassMapperBase<Recommendation> {
  RecommendationMapper._();

  static RecommendationMapper? _instance;
  static RecommendationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecommendationMapper._());
      ActivityTypeMapper.ensureInitialized();
      FitnessLevelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Recommendation';

  static DateTime _$bestStartHour(Recommendation v) => v.bestStartHour;
  static const Field<Recommendation, DateTime> _f$bestStartHour = Field(
    'bestStartHour',
    _$bestStartHour,
  );
  static DateTime _$bestEndHour(Recommendation v) => v.bestEndHour;
  static const Field<Recommendation, DateTime> _f$bestEndHour = Field(
    'bestEndHour',
    _$bestEndHour,
  );
  static int _$score(Recommendation v) => v.score;
  static const Field<Recommendation, int> _f$score = Field('score', _$score);
  static ScoreLabel _$scoreLabel(Recommendation v) => v.scoreLabel;
  static const Field<Recommendation, ScoreLabel> _f$scoreLabel = Field(
    'scoreLabel',
    _$scoreLabel,
  );
  static List<String> _$reasons(Recommendation v) => v.reasons;
  static const Field<Recommendation, List<String>> _f$reasons = Field(
    'reasons',
    _$reasons,
  );
  static List<String> _$warnings(Recommendation v) => v.warnings;
  static const Field<Recommendation, List<String>> _f$warnings = Field(
    'warnings',
    _$warnings,
  );
  static ActivityType _$activityType(Recommendation v) => v.activityType;
  static const Field<Recommendation, ActivityType> _f$activityType = Field(
    'activityType',
    _$activityType,
  );
  static FitnessLevel _$fitnessLevel(Recommendation v) => v.fitnessLevel;
  static const Field<Recommendation, FitnessLevel> _f$fitnessLevel = Field(
    'fitnessLevel',
    _$fitnessLevel,
  );

  @override
  final MappableFields<Recommendation> fields = const {
    #bestStartHour: _f$bestStartHour,
    #bestEndHour: _f$bestEndHour,
    #score: _f$score,
    #scoreLabel: _f$scoreLabel,
    #reasons: _f$reasons,
    #warnings: _f$warnings,
    #activityType: _f$activityType,
    #fitnessLevel: _f$fitnessLevel,
  };

  static Recommendation _instantiate(DecodingData data) {
    return Recommendation(
      bestStartHour: data.dec(_f$bestStartHour),
      bestEndHour: data.dec(_f$bestEndHour),
      score: data.dec(_f$score),
      scoreLabel: data.dec(_f$scoreLabel),
      reasons: data.dec(_f$reasons),
      warnings: data.dec(_f$warnings),
      activityType: data.dec(_f$activityType),
      fitnessLevel: data.dec(_f$fitnessLevel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Recommendation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Recommendation>(map);
  }

  static Recommendation fromJson(String json) {
    return ensureInitialized().decodeJson<Recommendation>(json);
  }
}

mixin RecommendationMappable {
  String toJson() {
    return RecommendationMapper.ensureInitialized().encodeJson<Recommendation>(
      this as Recommendation,
    );
  }

  Map<String, dynamic> toMap() {
    return RecommendationMapper.ensureInitialized().encodeMap<Recommendation>(
      this as Recommendation,
    );
  }

  RecommendationCopyWith<Recommendation, Recommendation, Recommendation>
  get copyWith => _RecommendationCopyWithImpl<Recommendation, Recommendation>(
    this as Recommendation,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RecommendationMapper.ensureInitialized().stringifyValue(
      this as Recommendation,
    );
  }

  @override
  bool operator ==(Object other) {
    return RecommendationMapper.ensureInitialized().equalsValue(
      this as Recommendation,
      other,
    );
  }

  @override
  int get hashCode {
    return RecommendationMapper.ensureInitialized().hashValue(
      this as Recommendation,
    );
  }
}

extension RecommendationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Recommendation, $Out> {
  RecommendationCopyWith<$R, Recommendation, $Out> get $asRecommendation =>
      $base.as((v, t, t2) => _RecommendationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecommendationCopyWith<$R, $In extends Recommendation, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get reasons;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get warnings;
  $R call({
    DateTime? bestStartHour,
    DateTime? bestEndHour,
    int? score,
    ScoreLabel? scoreLabel,
    List<String>? reasons,
    List<String>? warnings,
    ActivityType? activityType,
    FitnessLevel? fitnessLevel,
  });
  RecommendationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RecommendationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Recommendation, $Out>
    implements RecommendationCopyWith<$R, Recommendation, $Out> {
  _RecommendationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Recommendation> $mapper =
      RecommendationMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get reasons =>
      ListCopyWith(
        $value.reasons,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(reasons: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get warnings =>
      ListCopyWith(
        $value.warnings,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(warnings: v),
      );
  @override
  $R call({
    DateTime? bestStartHour,
    DateTime? bestEndHour,
    int? score,
    ScoreLabel? scoreLabel,
    List<String>? reasons,
    List<String>? warnings,
    ActivityType? activityType,
    FitnessLevel? fitnessLevel,
  }) => $apply(
    FieldCopyWithData({
      if (bestStartHour != null) #bestStartHour: bestStartHour,
      if (bestEndHour != null) #bestEndHour: bestEndHour,
      if (score != null) #score: score,
      if (scoreLabel != null) #scoreLabel: scoreLabel,
      if (reasons != null) #reasons: reasons,
      if (warnings != null) #warnings: warnings,
      if (activityType != null) #activityType: activityType,
      if (fitnessLevel != null) #fitnessLevel: fitnessLevel,
    }),
  );
  @override
  Recommendation $make(CopyWithData data) => Recommendation(
    bestStartHour: data.get(#bestStartHour, or: $value.bestStartHour),
    bestEndHour: data.get(#bestEndHour, or: $value.bestEndHour),
    score: data.get(#score, or: $value.score),
    scoreLabel: data.get(#scoreLabel, or: $value.scoreLabel),
    reasons: data.get(#reasons, or: $value.reasons),
    warnings: data.get(#warnings, or: $value.warnings),
    activityType: data.get(#activityType, or: $value.activityType),
    fitnessLevel: data.get(#fitnessLevel, or: $value.fitnessLevel),
  );

  @override
  RecommendationCopyWith<$R2, Recommendation, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RecommendationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

