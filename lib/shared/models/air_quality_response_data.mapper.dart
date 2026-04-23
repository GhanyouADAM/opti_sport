// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'air_quality_response_data.dart';

class AirQualityResponseDataMapper
    extends ClassMapperBase<AirQualityResponseData> {
  AirQualityResponseDataMapper._();

  static AirQualityResponseDataMapper? _instance;
  static AirQualityResponseDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AirQualityResponseDataMapper._());
      AirQualityHourlyRawDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AirQualityResponseData';

  static double _$latitude(AirQualityResponseData v) => v.latitude;
  static const Field<AirQualityResponseData, double> _f$latitude = Field(
    'latitude',
    _$latitude,
  );
  static double _$longitude(AirQualityResponseData v) => v.longitude;
  static const Field<AirQualityResponseData, double> _f$longitude = Field(
    'longitude',
    _$longitude,
  );
  static AirQualityHourlyRawData _$hourly(AirQualityResponseData v) => v.hourly;
  static const Field<AirQualityResponseData, AirQualityHourlyRawData>
  _f$hourly = Field('hourly', _$hourly);

  @override
  final MappableFields<AirQualityResponseData> fields = const {
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #hourly: _f$hourly,
  };

  static AirQualityResponseData _instantiate(DecodingData data) {
    return AirQualityResponseData(
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      hourly: data.dec(_f$hourly),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AirQualityResponseData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AirQualityResponseData>(map);
  }

  static AirQualityResponseData fromJson(String json) {
    return ensureInitialized().decodeJson<AirQualityResponseData>(json);
  }
}

mixin AirQualityResponseDataMappable {
  String toJson() {
    return AirQualityResponseDataMapper.ensureInitialized()
        .encodeJson<AirQualityResponseData>(this as AirQualityResponseData);
  }

  Map<String, dynamic> toMap() {
    return AirQualityResponseDataMapper.ensureInitialized()
        .encodeMap<AirQualityResponseData>(this as AirQualityResponseData);
  }

  AirQualityResponseDataCopyWith<
    AirQualityResponseData,
    AirQualityResponseData,
    AirQualityResponseData
  >
  get copyWith =>
      _AirQualityResponseDataCopyWithImpl<
        AirQualityResponseData,
        AirQualityResponseData
      >(this as AirQualityResponseData, $identity, $identity);
  @override
  String toString() {
    return AirQualityResponseDataMapper.ensureInitialized().stringifyValue(
      this as AirQualityResponseData,
    );
  }

  @override
  bool operator ==(Object other) {
    return AirQualityResponseDataMapper.ensureInitialized().equalsValue(
      this as AirQualityResponseData,
      other,
    );
  }

  @override
  int get hashCode {
    return AirQualityResponseDataMapper.ensureInitialized().hashValue(
      this as AirQualityResponseData,
    );
  }
}

extension AirQualityResponseDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AirQualityResponseData, $Out> {
  AirQualityResponseDataCopyWith<$R, AirQualityResponseData, $Out>
  get $asAirQualityResponseData => $base.as(
    (v, t, t2) => _AirQualityResponseDataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AirQualityResponseDataCopyWith<
  $R,
  $In extends AirQualityResponseData,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  AirQualityHourlyRawDataCopyWith<
    $R,
    AirQualityHourlyRawData,
    AirQualityHourlyRawData
  >
  get hourly;
  $R call({
    double? latitude,
    double? longitude,
    AirQualityHourlyRawData? hourly,
  });
  AirQualityResponseDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AirQualityResponseDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AirQualityResponseData, $Out>
    implements
        AirQualityResponseDataCopyWith<$R, AirQualityResponseData, $Out> {
  _AirQualityResponseDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AirQualityResponseData> $mapper =
      AirQualityResponseDataMapper.ensureInitialized();
  @override
  AirQualityHourlyRawDataCopyWith<
    $R,
    AirQualityHourlyRawData,
    AirQualityHourlyRawData
  >
  get hourly => $value.hourly.copyWith.$chain((v) => call(hourly: v));
  @override
  $R call({
    double? latitude,
    double? longitude,
    AirQualityHourlyRawData? hourly,
  }) => $apply(
    FieldCopyWithData({
      if (latitude != null) #latitude: latitude,
      if (longitude != null) #longitude: longitude,
      if (hourly != null) #hourly: hourly,
    }),
  );
  @override
  AirQualityResponseData $make(CopyWithData data) => AirQualityResponseData(
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    hourly: data.get(#hourly, or: $value.hourly),
  );

  @override
  AirQualityResponseDataCopyWith<$R2, AirQualityResponseData, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AirQualityResponseDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

