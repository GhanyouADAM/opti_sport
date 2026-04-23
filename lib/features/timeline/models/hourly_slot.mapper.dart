// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hourly_slot.dart';

class HourlySlotMapper extends ClassMapperBase<HourlySlot> {
  HourlySlotMapper._();

  static HourlySlotMapper? _instance;
  static HourlySlotMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HourlySlotMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HourlySlot';

  static DateTime _$hour(HourlySlot v) => v.hour;
  static const Field<HourlySlot, DateTime> _f$hour = Field('hour', _$hour);
  static double _$temperature(HourlySlot v) => v.temperature;
  static const Field<HourlySlot, double> _f$temperature = Field(
    'temperature',
    _$temperature,
  );
  static int _$humidity(HourlySlot v) => v.humidity;
  static const Field<HourlySlot, int> _f$humidity = Field(
    'humidity',
    _$humidity,
  );
  static double _$apparentTemperature(HourlySlot v) => v.apparentTemperature;
  static const Field<HourlySlot, double> _f$apparentTemperature = Field(
    'apparentTemperature',
    _$apparentTemperature,
  );
  static double _$windSpeed(HourlySlot v) => v.windSpeed;
  static const Field<HourlySlot, double> _f$windSpeed = Field(
    'windSpeed',
    _$windSpeed,
  );
  static double _$uvIndex(HourlySlot v) => v.uvIndex;
  static const Field<HourlySlot, double> _f$uvIndex = Field(
    'uvIndex',
    _$uvIndex,
  );
  static int _$precipitationProbability(HourlySlot v) =>
      v.precipitationProbability;
  static const Field<HourlySlot, int> _f$precipitationProbability = Field(
    'precipitationProbability',
    _$precipitationProbability,
  );
  static int _$weathercode(HourlySlot v) => v.weathercode;
  static const Field<HourlySlot, int> _f$weathercode = Field(
    'weathercode',
    _$weathercode,
  );
  static int? _$usAqi(HourlySlot v) => v.usAqi;
  static const Field<HourlySlot, int> _f$usAqi = Field(
    'usAqi',
    _$usAqi,
    opt: true,
  );
  static int _$score(HourlySlot v) => v.score;
  static const Field<HourlySlot, int> _f$score = Field('score', _$score);
  static ScoreLabel _$scoreLabel(HourlySlot v) => v.scoreLabel;
  static const Field<HourlySlot, ScoreLabel> _f$scoreLabel = Field(
    'scoreLabel',
    _$scoreLabel,
  );

  @override
  final MappableFields<HourlySlot> fields = const {
    #hour: _f$hour,
    #temperature: _f$temperature,
    #humidity: _f$humidity,
    #apparentTemperature: _f$apparentTemperature,
    #windSpeed: _f$windSpeed,
    #uvIndex: _f$uvIndex,
    #precipitationProbability: _f$precipitationProbability,
    #weathercode: _f$weathercode,
    #usAqi: _f$usAqi,
    #score: _f$score,
    #scoreLabel: _f$scoreLabel,
  };

  static HourlySlot _instantiate(DecodingData data) {
    return HourlySlot(
      hour: data.dec(_f$hour),
      temperature: data.dec(_f$temperature),
      humidity: data.dec(_f$humidity),
      apparentTemperature: data.dec(_f$apparentTemperature),
      windSpeed: data.dec(_f$windSpeed),
      uvIndex: data.dec(_f$uvIndex),
      precipitationProbability: data.dec(_f$precipitationProbability),
      weathercode: data.dec(_f$weathercode),
      usAqi: data.dec(_f$usAqi),
      score: data.dec(_f$score),
      scoreLabel: data.dec(_f$scoreLabel),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HourlySlot fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HourlySlot>(map);
  }

  static HourlySlot fromJson(String json) {
    return ensureInitialized().decodeJson<HourlySlot>(json);
  }
}

mixin HourlySlotMappable {
  String toJson() {
    return HourlySlotMapper.ensureInitialized().encodeJson<HourlySlot>(
      this as HourlySlot,
    );
  }

  Map<String, dynamic> toMap() {
    return HourlySlotMapper.ensureInitialized().encodeMap<HourlySlot>(
      this as HourlySlot,
    );
  }

  HourlySlotCopyWith<HourlySlot, HourlySlot, HourlySlot> get copyWith =>
      _HourlySlotCopyWithImpl<HourlySlot, HourlySlot>(
        this as HourlySlot,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HourlySlotMapper.ensureInitialized().stringifyValue(
      this as HourlySlot,
    );
  }

  @override
  bool operator ==(Object other) {
    return HourlySlotMapper.ensureInitialized().equalsValue(
      this as HourlySlot,
      other,
    );
  }

  @override
  int get hashCode {
    return HourlySlotMapper.ensureInitialized().hashValue(this as HourlySlot);
  }
}

extension HourlySlotValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HourlySlot, $Out> {
  HourlySlotCopyWith<$R, HourlySlot, $Out> get $asHourlySlot =>
      $base.as((v, t, t2) => _HourlySlotCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HourlySlotCopyWith<$R, $In extends HourlySlot, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    DateTime? hour,
    double? temperature,
    int? humidity,
    double? apparentTemperature,
    double? windSpeed,
    double? uvIndex,
    int? precipitationProbability,
    int? weathercode,
    int? usAqi,
    int? score,
    ScoreLabel? scoreLabel,
  });
  HourlySlotCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HourlySlotCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HourlySlot, $Out>
    implements HourlySlotCopyWith<$R, HourlySlot, $Out> {
  _HourlySlotCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HourlySlot> $mapper =
      HourlySlotMapper.ensureInitialized();
  @override
  $R call({
    DateTime? hour,
    double? temperature,
    int? humidity,
    double? apparentTemperature,
    double? windSpeed,
    double? uvIndex,
    int? precipitationProbability,
    int? weathercode,
    Object? usAqi = $none,
    int? score,
    ScoreLabel? scoreLabel,
  }) => $apply(
    FieldCopyWithData({
      if (hour != null) #hour: hour,
      if (temperature != null) #temperature: temperature,
      if (humidity != null) #humidity: humidity,
      if (apparentTemperature != null)
        #apparentTemperature: apparentTemperature,
      if (windSpeed != null) #windSpeed: windSpeed,
      if (uvIndex != null) #uvIndex: uvIndex,
      if (precipitationProbability != null)
        #precipitationProbability: precipitationProbability,
      if (weathercode != null) #weathercode: weathercode,
      if (usAqi != $none) #usAqi: usAqi,
      if (score != null) #score: score,
      if (scoreLabel != null) #scoreLabel: scoreLabel,
    }),
  );
  @override
  HourlySlot $make(CopyWithData data) => HourlySlot(
    hour: data.get(#hour, or: $value.hour),
    temperature: data.get(#temperature, or: $value.temperature),
    humidity: data.get(#humidity, or: $value.humidity),
    apparentTemperature: data.get(
      #apparentTemperature,
      or: $value.apparentTemperature,
    ),
    windSpeed: data.get(#windSpeed, or: $value.windSpeed),
    uvIndex: data.get(#uvIndex, or: $value.uvIndex),
    precipitationProbability: data.get(
      #precipitationProbability,
      or: $value.precipitationProbability,
    ),
    weathercode: data.get(#weathercode, or: $value.weathercode),
    usAqi: data.get(#usAqi, or: $value.usAqi),
    score: data.get(#score, or: $value.score),
    scoreLabel: data.get(#scoreLabel, or: $value.scoreLabel),
  );

  @override
  HourlySlotCopyWith<$R2, HourlySlot, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HourlySlotCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

