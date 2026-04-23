// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'air_quality_hourly_raw_data.dart';

class AirQualityHourlyRawDataMapper
    extends ClassMapperBase<AirQualityHourlyRawData> {
  AirQualityHourlyRawDataMapper._();

  static AirQualityHourlyRawDataMapper? _instance;
  static AirQualityHourlyRawDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AirQualityHourlyRawDataMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AirQualityHourlyRawData';

  static List<String> _$time(AirQualityHourlyRawData v) => v.time;
  static const Field<AirQualityHourlyRawData, List<String>> _f$time = Field(
    'time',
    _$time,
  );
  static List<double?> _$pm25(AirQualityHourlyRawData v) => v.pm25;
  static const Field<AirQualityHourlyRawData, List<double?>> _f$pm25 = Field(
    'pm25',
    _$pm25,
    key: r'pm2_5',
  );
  static List<int?> _$usAqi(AirQualityHourlyRawData v) => v.usAqi;
  static const Field<AirQualityHourlyRawData, List<int?>> _f$usAqi = Field(
    'usAqi',
    _$usAqi,
    key: r'us_aqi',
  );

  @override
  final MappableFields<AirQualityHourlyRawData> fields = const {
    #time: _f$time,
    #pm25: _f$pm25,
    #usAqi: _f$usAqi,
  };

  static AirQualityHourlyRawData _instantiate(DecodingData data) {
    return AirQualityHourlyRawData(
      time: data.dec(_f$time),
      pm25: data.dec(_f$pm25),
      usAqi: data.dec(_f$usAqi),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AirQualityHourlyRawData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AirQualityHourlyRawData>(map);
  }

  static AirQualityHourlyRawData fromJson(String json) {
    return ensureInitialized().decodeJson<AirQualityHourlyRawData>(json);
  }
}

mixin AirQualityHourlyRawDataMappable {
  String toJson() {
    return AirQualityHourlyRawDataMapper.ensureInitialized()
        .encodeJson<AirQualityHourlyRawData>(this as AirQualityHourlyRawData);
  }

  Map<String, dynamic> toMap() {
    return AirQualityHourlyRawDataMapper.ensureInitialized()
        .encodeMap<AirQualityHourlyRawData>(this as AirQualityHourlyRawData);
  }

  AirQualityHourlyRawDataCopyWith<
    AirQualityHourlyRawData,
    AirQualityHourlyRawData,
    AirQualityHourlyRawData
  >
  get copyWith =>
      _AirQualityHourlyRawDataCopyWithImpl<
        AirQualityHourlyRawData,
        AirQualityHourlyRawData
      >(this as AirQualityHourlyRawData, $identity, $identity);
  @override
  String toString() {
    return AirQualityHourlyRawDataMapper.ensureInitialized().stringifyValue(
      this as AirQualityHourlyRawData,
    );
  }

  @override
  bool operator ==(Object other) {
    return AirQualityHourlyRawDataMapper.ensureInitialized().equalsValue(
      this as AirQualityHourlyRawData,
      other,
    );
  }

  @override
  int get hashCode {
    return AirQualityHourlyRawDataMapper.ensureInitialized().hashValue(
      this as AirQualityHourlyRawData,
    );
  }
}

extension AirQualityHourlyRawDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AirQualityHourlyRawData, $Out> {
  AirQualityHourlyRawDataCopyWith<$R, AirQualityHourlyRawData, $Out>
  get $asAirQualityHourlyRawData => $base.as(
    (v, t, t2) => _AirQualityHourlyRawDataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AirQualityHourlyRawDataCopyWith<
  $R,
  $In extends AirQualityHourlyRawData,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get time;
  ListCopyWith<$R, double?, ObjectCopyWith<$R, double?, double?>?> get pm25;
  ListCopyWith<$R, int?, ObjectCopyWith<$R, int?, int?>?> get usAqi;
  $R call({List<String>? time, List<double?>? pm25, List<int?>? usAqi});
  AirQualityHourlyRawDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AirQualityHourlyRawDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AirQualityHourlyRawData, $Out>
    implements
        AirQualityHourlyRawDataCopyWith<$R, AirQualityHourlyRawData, $Out> {
  _AirQualityHourlyRawDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AirQualityHourlyRawData> $mapper =
      AirQualityHourlyRawDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get time =>
      ListCopyWith(
        $value.time,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(time: v),
      );
  @override
  ListCopyWith<$R, double?, ObjectCopyWith<$R, double?, double?>?> get pm25 =>
      ListCopyWith(
        $value.pm25,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(pm25: v),
      );
  @override
  ListCopyWith<$R, int?, ObjectCopyWith<$R, int?, int?>?> get usAqi =>
      ListCopyWith(
        $value.usAqi,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(usAqi: v),
      );
  @override
  $R call({List<String>? time, List<double?>? pm25, List<int?>? usAqi}) =>
      $apply(
        FieldCopyWithData({
          if (time != null) #time: time,
          if (pm25 != null) #pm25: pm25,
          if (usAqi != null) #usAqi: usAqi,
        }),
      );
  @override
  AirQualityHourlyRawData $make(CopyWithData data) => AirQualityHourlyRawData(
    time: data.get(#time, or: $value.time),
    pm25: data.get(#pm25, or: $value.pm25),
    usAqi: data.get(#usAqi, or: $value.usAqi),
  );

  @override
  AirQualityHourlyRawDataCopyWith<$R2, AirQualityHourlyRawData, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AirQualityHourlyRawDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

