// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'forecast_day.dart';

class ForecastDayMapper extends ClassMapperBase<ForecastDay> {
  ForecastDayMapper._();

  static ForecastDayMapper? _instance;
  static ForecastDayMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ForecastDayMapper._());
      HourlySlotMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ForecastDay';

  static DateTime _$date(ForecastDay v) => v.date;
  static const Field<ForecastDay, DateTime> _f$date = Field('date', _$date);
  static double _$minTemperature(ForecastDay v) => v.minTemperature;
  static const Field<ForecastDay, double> _f$minTemperature = Field(
    'minTemperature',
    _$minTemperature,
  );
  static double _$maxTemperature(ForecastDay v) => v.maxTemperature;
  static const Field<ForecastDay, double> _f$maxTemperature = Field(
    'maxTemperature',
    _$maxTemperature,
  );
  static int _$dominantWeatherCode(ForecastDay v) => v.dominantWeatherCode;
  static const Field<ForecastDay, int> _f$dominantWeatherCode = Field(
    'dominantWeatherCode',
    _$dominantWeatherCode,
  );
  static HourlySlot _$bestSlot(ForecastDay v) => v.bestSlot;
  static const Field<ForecastDay, HourlySlot> _f$bestSlot = Field(
    'bestSlot',
    _$bestSlot,
  );
  static int _$dayScore(ForecastDay v) => v.dayScore;
  static const Field<ForecastDay, int> _f$dayScore = Field(
    'dayScore',
    _$dayScore,
  );

  @override
  final MappableFields<ForecastDay> fields = const {
    #date: _f$date,
    #minTemperature: _f$minTemperature,
    #maxTemperature: _f$maxTemperature,
    #dominantWeatherCode: _f$dominantWeatherCode,
    #bestSlot: _f$bestSlot,
    #dayScore: _f$dayScore,
  };

  static ForecastDay _instantiate(DecodingData data) {
    return ForecastDay(
      date: data.dec(_f$date),
      minTemperature: data.dec(_f$minTemperature),
      maxTemperature: data.dec(_f$maxTemperature),
      dominantWeatherCode: data.dec(_f$dominantWeatherCode),
      bestSlot: data.dec(_f$bestSlot),
      dayScore: data.dec(_f$dayScore),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ForecastDay fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ForecastDay>(map);
  }

  static ForecastDay fromJson(String json) {
    return ensureInitialized().decodeJson<ForecastDay>(json);
  }
}

mixin ForecastDayMappable {
  String toJson() {
    return ForecastDayMapper.ensureInitialized().encodeJson<ForecastDay>(
      this as ForecastDay,
    );
  }

  Map<String, dynamic> toMap() {
    return ForecastDayMapper.ensureInitialized().encodeMap<ForecastDay>(
      this as ForecastDay,
    );
  }

  ForecastDayCopyWith<ForecastDay, ForecastDay, ForecastDay> get copyWith =>
      _ForecastDayCopyWithImpl<ForecastDay, ForecastDay>(
        this as ForecastDay,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ForecastDayMapper.ensureInitialized().stringifyValue(
      this as ForecastDay,
    );
  }

  @override
  bool operator ==(Object other) {
    return ForecastDayMapper.ensureInitialized().equalsValue(
      this as ForecastDay,
      other,
    );
  }

  @override
  int get hashCode {
    return ForecastDayMapper.ensureInitialized().hashValue(this as ForecastDay);
  }
}

extension ForecastDayValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ForecastDay, $Out> {
  ForecastDayCopyWith<$R, ForecastDay, $Out> get $asForecastDay =>
      $base.as((v, t, t2) => _ForecastDayCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ForecastDayCopyWith<$R, $In extends ForecastDay, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  HourlySlotCopyWith<$R, HourlySlot, HourlySlot> get bestSlot;
  $R call({
    DateTime? date,
    double? minTemperature,
    double? maxTemperature,
    int? dominantWeatherCode,
    HourlySlot? bestSlot,
    int? dayScore,
  });
  ForecastDayCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ForecastDayCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ForecastDay, $Out>
    implements ForecastDayCopyWith<$R, ForecastDay, $Out> {
  _ForecastDayCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ForecastDay> $mapper =
      ForecastDayMapper.ensureInitialized();
  @override
  HourlySlotCopyWith<$R, HourlySlot, HourlySlot> get bestSlot =>
      $value.bestSlot.copyWith.$chain((v) => call(bestSlot: v));
  @override
  $R call({
    DateTime? date,
    double? minTemperature,
    double? maxTemperature,
    int? dominantWeatherCode,
    HourlySlot? bestSlot,
    int? dayScore,
  }) => $apply(
    FieldCopyWithData({
      if (date != null) #date: date,
      if (minTemperature != null) #minTemperature: minTemperature,
      if (maxTemperature != null) #maxTemperature: maxTemperature,
      if (dominantWeatherCode != null)
        #dominantWeatherCode: dominantWeatherCode,
      if (bestSlot != null) #bestSlot: bestSlot,
      if (dayScore != null) #dayScore: dayScore,
    }),
  );
  @override
  ForecastDay $make(CopyWithData data) => ForecastDay(
    date: data.get(#date, or: $value.date),
    minTemperature: data.get(#minTemperature, or: $value.minTemperature),
    maxTemperature: data.get(#maxTemperature, or: $value.maxTemperature),
    dominantWeatherCode: data.get(
      #dominantWeatherCode,
      or: $value.dominantWeatherCode,
    ),
    bestSlot: data.get(#bestSlot, or: $value.bestSlot),
    dayScore: data.get(#dayScore, or: $value.dayScore),
  );

  @override
  ForecastDayCopyWith<$R2, ForecastDay, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ForecastDayCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

