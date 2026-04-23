// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cached_weather_entry.dart';

class CachedWeatherEntryMapper extends ClassMapperBase<CachedWeatherEntry> {
  CachedWeatherEntryMapper._();

  static CachedWeatherEntryMapper? _instance;
  static CachedWeatherEntryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CachedWeatherEntryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CachedWeatherEntry';

  static int? _$id(CachedWeatherEntry v) => v.id;
  static const Field<CachedWeatherEntry, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static double _$temperature(CachedWeatherEntry v) => v.temperature;
  static const Field<CachedWeatherEntry, double> _f$temperature = Field(
    'temperature',
    _$temperature,
  );
  static int _$humidity(CachedWeatherEntry v) => v.humidity;
  static const Field<CachedWeatherEntry, int> _f$humidity = Field(
    'humidity',
    _$humidity,
  );
  static double _$windspeed(CachedWeatherEntry v) => v.windspeed;
  static const Field<CachedWeatherEntry, double> _f$windspeed = Field(
    'windspeed',
    _$windspeed,
  );
  static DateTime _$hour(CachedWeatherEntry v) => v.hour;
  static const Field<CachedWeatherEntry, DateTime> _f$hour = Field(
    'hour',
    _$hour,
  );
  static double _$apparentTemperature(CachedWeatherEntry v) =>
      v.apparentTemperature;
  static const Field<CachedWeatherEntry, double> _f$apparentTemperature = Field(
    'apparentTemperature',
    _$apparentTemperature,
    key: r'apparent_temperature',
  );
  static int _$precipitationProbability(CachedWeatherEntry v) =>
      v.precipitationProbability;
  static const Field<CachedWeatherEntry, int> _f$precipitationProbability =
      Field(
        'precipitationProbability',
        _$precipitationProbability,
        key: r'precipitation_probability',
      );
  static double _$uvIndex(CachedWeatherEntry v) => v.uvIndex;
  static const Field<CachedWeatherEntry, double> _f$uvIndex = Field(
    'uvIndex',
    _$uvIndex,
    key: r'uv_index',
  );
  static int _$cloudcover(CachedWeatherEntry v) => v.cloudcover;
  static const Field<CachedWeatherEntry, int> _f$cloudcover = Field(
    'cloudcover',
    _$cloudcover,
  );
  static int _$weathercode(CachedWeatherEntry v) => v.weathercode;
  static const Field<CachedWeatherEntry, int> _f$weathercode = Field(
    'weathercode',
    _$weathercode,
  );
  static double? _$pm25(CachedWeatherEntry v) => v.pm25;
  static const Field<CachedWeatherEntry, double> _f$pm25 = Field(
    'pm25',
    _$pm25,
    opt: true,
  );
  static int? _$usAqi(CachedWeatherEntry v) => v.usAqi;
  static const Field<CachedWeatherEntry, int> _f$usAqi = Field(
    'usAqi',
    _$usAqi,
    key: r'us_aqi',
    opt: true,
  );
  static double _$latitude(CachedWeatherEntry v) => v.latitude;
  static const Field<CachedWeatherEntry, double> _f$latitude = Field(
    'latitude',
    _$latitude,
  );
  static double _$longitude(CachedWeatherEntry v) => v.longitude;
  static const Field<CachedWeatherEntry, double> _f$longitude = Field(
    'longitude',
    _$longitude,
  );
  static DateTime _$cachedAt(CachedWeatherEntry v) => v.cachedAt;
  static const Field<CachedWeatherEntry, DateTime> _f$cachedAt = Field(
    'cachedAt',
    _$cachedAt,
    key: r'cached_at',
  );

  @override
  final MappableFields<CachedWeatherEntry> fields = const {
    #id: _f$id,
    #temperature: _f$temperature,
    #humidity: _f$humidity,
    #windspeed: _f$windspeed,
    #hour: _f$hour,
    #apparentTemperature: _f$apparentTemperature,
    #precipitationProbability: _f$precipitationProbability,
    #uvIndex: _f$uvIndex,
    #cloudcover: _f$cloudcover,
    #weathercode: _f$weathercode,
    #pm25: _f$pm25,
    #usAqi: _f$usAqi,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #cachedAt: _f$cachedAt,
  };

  static CachedWeatherEntry _instantiate(DecodingData data) {
    return CachedWeatherEntry(
      id: data.dec(_f$id),
      temperature: data.dec(_f$temperature),
      humidity: data.dec(_f$humidity),
      windspeed: data.dec(_f$windspeed),
      hour: data.dec(_f$hour),
      apparentTemperature: data.dec(_f$apparentTemperature),
      precipitationProbability: data.dec(_f$precipitationProbability),
      uvIndex: data.dec(_f$uvIndex),
      cloudcover: data.dec(_f$cloudcover),
      weathercode: data.dec(_f$weathercode),
      pm25: data.dec(_f$pm25),
      usAqi: data.dec(_f$usAqi),
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      cachedAt: data.dec(_f$cachedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CachedWeatherEntry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CachedWeatherEntry>(map);
  }

  static CachedWeatherEntry fromJson(String json) {
    return ensureInitialized().decodeJson<CachedWeatherEntry>(json);
  }
}

mixin CachedWeatherEntryMappable {
  String toJson() {
    return CachedWeatherEntryMapper.ensureInitialized()
        .encodeJson<CachedWeatherEntry>(this as CachedWeatherEntry);
  }

  Map<String, dynamic> toMap() {
    return CachedWeatherEntryMapper.ensureInitialized()
        .encodeMap<CachedWeatherEntry>(this as CachedWeatherEntry);
  }

  CachedWeatherEntryCopyWith<
    CachedWeatherEntry,
    CachedWeatherEntry,
    CachedWeatherEntry
  >
  get copyWith =>
      _CachedWeatherEntryCopyWithImpl<CachedWeatherEntry, CachedWeatherEntry>(
        this as CachedWeatherEntry,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CachedWeatherEntryMapper.ensureInitialized().stringifyValue(
      this as CachedWeatherEntry,
    );
  }

  @override
  bool operator ==(Object other) {
    return CachedWeatherEntryMapper.ensureInitialized().equalsValue(
      this as CachedWeatherEntry,
      other,
    );
  }

  @override
  int get hashCode {
    return CachedWeatherEntryMapper.ensureInitialized().hashValue(
      this as CachedWeatherEntry,
    );
  }
}

extension CachedWeatherEntryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CachedWeatherEntry, $Out> {
  CachedWeatherEntryCopyWith<$R, CachedWeatherEntry, $Out>
  get $asCachedWeatherEntry => $base.as(
    (v, t, t2) => _CachedWeatherEntryCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CachedWeatherEntryCopyWith<
  $R,
  $In extends CachedWeatherEntry,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    double? temperature,
    int? humidity,
    double? windspeed,
    DateTime? hour,
    double? apparentTemperature,
    int? precipitationProbability,
    double? uvIndex,
    int? cloudcover,
    int? weathercode,
    double? pm25,
    int? usAqi,
    double? latitude,
    double? longitude,
    DateTime? cachedAt,
  });
  CachedWeatherEntryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CachedWeatherEntryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CachedWeatherEntry, $Out>
    implements CachedWeatherEntryCopyWith<$R, CachedWeatherEntry, $Out> {
  _CachedWeatherEntryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CachedWeatherEntry> $mapper =
      CachedWeatherEntryMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    double? temperature,
    int? humidity,
    double? windspeed,
    DateTime? hour,
    double? apparentTemperature,
    int? precipitationProbability,
    double? uvIndex,
    int? cloudcover,
    int? weathercode,
    Object? pm25 = $none,
    Object? usAqi = $none,
    double? latitude,
    double? longitude,
    DateTime? cachedAt,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (temperature != null) #temperature: temperature,
      if (humidity != null) #humidity: humidity,
      if (windspeed != null) #windspeed: windspeed,
      if (hour != null) #hour: hour,
      if (apparentTemperature != null)
        #apparentTemperature: apparentTemperature,
      if (precipitationProbability != null)
        #precipitationProbability: precipitationProbability,
      if (uvIndex != null) #uvIndex: uvIndex,
      if (cloudcover != null) #cloudcover: cloudcover,
      if (weathercode != null) #weathercode: weathercode,
      if (pm25 != $none) #pm25: pm25,
      if (usAqi != $none) #usAqi: usAqi,
      if (latitude != null) #latitude: latitude,
      if (longitude != null) #longitude: longitude,
      if (cachedAt != null) #cachedAt: cachedAt,
    }),
  );
  @override
  CachedWeatherEntry $make(CopyWithData data) => CachedWeatherEntry(
    id: data.get(#id, or: $value.id),
    temperature: data.get(#temperature, or: $value.temperature),
    humidity: data.get(#humidity, or: $value.humidity),
    windspeed: data.get(#windspeed, or: $value.windspeed),
    hour: data.get(#hour, or: $value.hour),
    apparentTemperature: data.get(
      #apparentTemperature,
      or: $value.apparentTemperature,
    ),
    precipitationProbability: data.get(
      #precipitationProbability,
      or: $value.precipitationProbability,
    ),
    uvIndex: data.get(#uvIndex, or: $value.uvIndex),
    cloudcover: data.get(#cloudcover, or: $value.cloudcover),
    weathercode: data.get(#weathercode, or: $value.weathercode),
    pm25: data.get(#pm25, or: $value.pm25),
    usAqi: data.get(#usAqi, or: $value.usAqi),
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    cachedAt: data.get(#cachedAt, or: $value.cachedAt),
  );

  @override
  CachedWeatherEntryCopyWith<$R2, CachedWeatherEntry, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CachedWeatherEntryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

