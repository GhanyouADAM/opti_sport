// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'weather_response_data.dart';

class WeatherResponseDataMapper extends ClassMapperBase<WeatherResponseData> {
  WeatherResponseDataMapper._();

  static WeatherResponseDataMapper? _instance;
  static WeatherResponseDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeatherResponseDataMapper._());
      WeatherHourlyRawDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WeatherResponseData';

  static double _$latitude(WeatherResponseData v) => v.latitude;
  static const Field<WeatherResponseData, double> _f$latitude = Field(
    'latitude',
    _$latitude,
  );
  static double _$longitude(WeatherResponseData v) => v.longitude;
  static const Field<WeatherResponseData, double> _f$longitude = Field(
    'longitude',
    _$longitude,
  );
  static double _$elevation(WeatherResponseData v) => v.elevation;
  static const Field<WeatherResponseData, double> _f$elevation = Field(
    'elevation',
    _$elevation,
  );
  static String _$timezone(WeatherResponseData v) => v.timezone;
  static const Field<WeatherResponseData, String> _f$timezone = Field(
    'timezone',
    _$timezone,
  );
  static WeatherHourlyRawData _$hourly(WeatherResponseData v) => v.hourly;
  static const Field<WeatherResponseData, WeatherHourlyRawData> _f$hourly =
      Field('hourly', _$hourly);

  @override
  final MappableFields<WeatherResponseData> fields = const {
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #elevation: _f$elevation,
    #timezone: _f$timezone,
    #hourly: _f$hourly,
  };

  static WeatherResponseData _instantiate(DecodingData data) {
    return WeatherResponseData(
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      elevation: data.dec(_f$elevation),
      timezone: data.dec(_f$timezone),
      hourly: data.dec(_f$hourly),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WeatherResponseData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeatherResponseData>(map);
  }

  static WeatherResponseData fromJson(String json) {
    return ensureInitialized().decodeJson<WeatherResponseData>(json);
  }
}

mixin WeatherResponseDataMappable {
  String toJson() {
    return WeatherResponseDataMapper.ensureInitialized()
        .encodeJson<WeatherResponseData>(this as WeatherResponseData);
  }

  Map<String, dynamic> toMap() {
    return WeatherResponseDataMapper.ensureInitialized()
        .encodeMap<WeatherResponseData>(this as WeatherResponseData);
  }

  WeatherResponseDataCopyWith<
    WeatherResponseData,
    WeatherResponseData,
    WeatherResponseData
  >
  get copyWith =>
      _WeatherResponseDataCopyWithImpl<
        WeatherResponseData,
        WeatherResponseData
      >(this as WeatherResponseData, $identity, $identity);
  @override
  String toString() {
    return WeatherResponseDataMapper.ensureInitialized().stringifyValue(
      this as WeatherResponseData,
    );
  }

  @override
  bool operator ==(Object other) {
    return WeatherResponseDataMapper.ensureInitialized().equalsValue(
      this as WeatherResponseData,
      other,
    );
  }

  @override
  int get hashCode {
    return WeatherResponseDataMapper.ensureInitialized().hashValue(
      this as WeatherResponseData,
    );
  }
}

extension WeatherResponseDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeatherResponseData, $Out> {
  WeatherResponseDataCopyWith<$R, WeatherResponseData, $Out>
  get $asWeatherResponseData => $base.as(
    (v, t, t2) => _WeatherResponseDataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WeatherResponseDataCopyWith<
  $R,
  $In extends WeatherResponseData,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  WeatherHourlyRawDataCopyWith<$R, WeatherHourlyRawData, WeatherHourlyRawData>
  get hourly;
  $R call({
    double? latitude,
    double? longitude,
    double? elevation,
    String? timezone,
    WeatherHourlyRawData? hourly,
  });
  WeatherResponseDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WeatherResponseDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeatherResponseData, $Out>
    implements WeatherResponseDataCopyWith<$R, WeatherResponseData, $Out> {
  _WeatherResponseDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeatherResponseData> $mapper =
      WeatherResponseDataMapper.ensureInitialized();
  @override
  WeatherHourlyRawDataCopyWith<$R, WeatherHourlyRawData, WeatherHourlyRawData>
  get hourly => $value.hourly.copyWith.$chain((v) => call(hourly: v));
  @override
  $R call({
    double? latitude,
    double? longitude,
    double? elevation,
    String? timezone,
    WeatherHourlyRawData? hourly,
  }) => $apply(
    FieldCopyWithData({
      if (latitude != null) #latitude: latitude,
      if (longitude != null) #longitude: longitude,
      if (elevation != null) #elevation: elevation,
      if (timezone != null) #timezone: timezone,
      if (hourly != null) #hourly: hourly,
    }),
  );
  @override
  WeatherResponseData $make(CopyWithData data) => WeatherResponseData(
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    elevation: data.get(#elevation, or: $value.elevation),
    timezone: data.get(#timezone, or: $value.timezone),
    hourly: data.get(#hourly, or: $value.hourly),
  );

  @override
  WeatherResponseDataCopyWith<$R2, WeatherResponseData, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WeatherResponseDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

