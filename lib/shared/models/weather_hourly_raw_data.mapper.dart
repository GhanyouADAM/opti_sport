// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'weather_hourly_raw_data.dart';

class WeatherHourlyRawDataMapper extends ClassMapperBase<WeatherHourlyRawData> {
  WeatherHourlyRawDataMapper._();

  static WeatherHourlyRawDataMapper? _instance;
  static WeatherHourlyRawDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeatherHourlyRawDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WeatherHourlyRawData';

  static List<double> _$temperature(WeatherHourlyRawData v) => v.temperature;
  static const Field<WeatherHourlyRawData, List<double>> _f$temperature = Field(
    'temperature',
    _$temperature,
    key: r'temperature_2m',
  );
  static List<int> _$humidity(WeatherHourlyRawData v) => v.humidity;
  static const Field<WeatherHourlyRawData, List<int>> _f$humidity = Field(
    'humidity',
    _$humidity,
    key: r'relative_humidity_2m',
  );
  static List<double> _$windSpeed(WeatherHourlyRawData v) => v.windSpeed;
  static const Field<WeatherHourlyRawData, List<double>> _f$windSpeed = Field(
    'windSpeed',
    _$windSpeed,
    key: r'windspeed_10m',
  );
  static List<String> _$time(WeatherHourlyRawData v) => v.time;
  static const Field<WeatherHourlyRawData, List<String>> _f$time = Field(
    'time',
    _$time,
  );
  static List<double> _$apparentTemperature(WeatherHourlyRawData v) =>
      v.apparentTemperature;
  static const Field<WeatherHourlyRawData, List<double>>
  _f$apparentTemperature = Field(
    'apparentTemperature',
    _$apparentTemperature,
    key: r'apparent_temperature',
  );
  static List<int> _$precipitationProbability(WeatherHourlyRawData v) =>
      v.precipitationProbability;
  static const Field<WeatherHourlyRawData, List<int>>
  _f$precipitationProbability = Field(
    'precipitationProbability',
    _$precipitationProbability,
    key: r'precipitation_probability',
  );
  static List<double> _$uvIndex(WeatherHourlyRawData v) => v.uvIndex;
  static const Field<WeatherHourlyRawData, List<double>> _f$uvIndex = Field(
    'uvIndex',
    _$uvIndex,
    key: r'uv_index',
  );
  static List<int> _$cloudcover(WeatherHourlyRawData v) => v.cloudcover;
  static const Field<WeatherHourlyRawData, List<int>> _f$cloudcover = Field(
    'cloudcover',
    _$cloudcover,
  );
  static List<int> _$weathercode(WeatherHourlyRawData v) => v.weathercode;
  static const Field<WeatherHourlyRawData, List<int>> _f$weathercode = Field(
    'weathercode',
    _$weathercode,
  );

  @override
  final MappableFields<WeatherHourlyRawData> fields = const {
    #temperature: _f$temperature,
    #humidity: _f$humidity,
    #windSpeed: _f$windSpeed,
    #time: _f$time,
    #apparentTemperature: _f$apparentTemperature,
    #precipitationProbability: _f$precipitationProbability,
    #uvIndex: _f$uvIndex,
    #cloudcover: _f$cloudcover,
    #weathercode: _f$weathercode,
  };

  static WeatherHourlyRawData _instantiate(DecodingData data) {
    return WeatherHourlyRawData(
      temperature: data.dec(_f$temperature),
      humidity: data.dec(_f$humidity),
      windSpeed: data.dec(_f$windSpeed),
      time: data.dec(_f$time),
      apparentTemperature: data.dec(_f$apparentTemperature),
      precipitationProbability: data.dec(_f$precipitationProbability),
      uvIndex: data.dec(_f$uvIndex),
      cloudcover: data.dec(_f$cloudcover),
      weathercode: data.dec(_f$weathercode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WeatherHourlyRawData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeatherHourlyRawData>(map);
  }

  static WeatherHourlyRawData fromJson(String json) {
    return ensureInitialized().decodeJson<WeatherHourlyRawData>(json);
  }
}

mixin WeatherHourlyRawDataMappable {
  String toJson() {
    return WeatherHourlyRawDataMapper.ensureInitialized()
        .encodeJson<WeatherHourlyRawData>(this as WeatherHourlyRawData);
  }

  Map<String, dynamic> toMap() {
    return WeatherHourlyRawDataMapper.ensureInitialized()
        .encodeMap<WeatherHourlyRawData>(this as WeatherHourlyRawData);
  }

  WeatherHourlyRawDataCopyWith<
    WeatherHourlyRawData,
    WeatherHourlyRawData,
    WeatherHourlyRawData
  >
  get copyWith =>
      _WeatherHourlyRawDataCopyWithImpl<
        WeatherHourlyRawData,
        WeatherHourlyRawData
      >(this as WeatherHourlyRawData, $identity, $identity);
  @override
  String toString() {
    return WeatherHourlyRawDataMapper.ensureInitialized().stringifyValue(
      this as WeatherHourlyRawData,
    );
  }

  @override
  bool operator ==(Object other) {
    return WeatherHourlyRawDataMapper.ensureInitialized().equalsValue(
      this as WeatherHourlyRawData,
      other,
    );
  }

  @override
  int get hashCode {
    return WeatherHourlyRawDataMapper.ensureInitialized().hashValue(
      this as WeatherHourlyRawData,
    );
  }
}

extension WeatherHourlyRawDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeatherHourlyRawData, $Out> {
  WeatherHourlyRawDataCopyWith<$R, WeatherHourlyRawData, $Out>
  get $asWeatherHourlyRawData => $base.as(
    (v, t, t2) => _WeatherHourlyRawDataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class WeatherHourlyRawDataCopyWith<
  $R,
  $In extends WeatherHourlyRawData,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get temperature;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get humidity;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get windSpeed;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get time;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>
  get apparentTemperature;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
  get precipitationProbability;
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get uvIndex;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get cloudcover;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weathercode;
  $R call({
    List<double>? temperature,
    List<int>? humidity,
    List<double>? windSpeed,
    List<String>? time,
    List<double>? apparentTemperature,
    List<int>? precipitationProbability,
    List<double>? uvIndex,
    List<int>? cloudcover,
    List<int>? weathercode,
  });
  WeatherHourlyRawDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WeatherHourlyRawDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeatherHourlyRawData, $Out>
    implements WeatherHourlyRawDataCopyWith<$R, WeatherHourlyRawData, $Out> {
  _WeatherHourlyRawDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeatherHourlyRawData> $mapper =
      WeatherHourlyRawDataMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>
  get temperature => ListCopyWith(
    $value.temperature,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(temperature: v),
  );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get humidity =>
      ListCopyWith(
        $value.humidity,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(humidity: v),
      );
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get windSpeed =>
      ListCopyWith(
        $value.windSpeed,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(windSpeed: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get time =>
      ListCopyWith(
        $value.time,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(time: v),
      );
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>
  get apparentTemperature => ListCopyWith(
    $value.apparentTemperature,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(apparentTemperature: v),
  );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
  get precipitationProbability => ListCopyWith(
    $value.precipitationProbability,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(precipitationProbability: v),
  );
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get uvIndex =>
      ListCopyWith(
        $value.uvIndex,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(uvIndex: v),
      );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get cloudcover =>
      ListCopyWith(
        $value.cloudcover,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(cloudcover: v),
      );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get weathercode =>
      ListCopyWith(
        $value.weathercode,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(weathercode: v),
      );
  @override
  $R call({
    List<double>? temperature,
    List<int>? humidity,
    List<double>? windSpeed,
    List<String>? time,
    List<double>? apparentTemperature,
    List<int>? precipitationProbability,
    List<double>? uvIndex,
    List<int>? cloudcover,
    List<int>? weathercode,
  }) => $apply(
    FieldCopyWithData({
      if (temperature != null) #temperature: temperature,
      if (humidity != null) #humidity: humidity,
      if (windSpeed != null) #windSpeed: windSpeed,
      if (time != null) #time: time,
      if (apparentTemperature != null)
        #apparentTemperature: apparentTemperature,
      if (precipitationProbability != null)
        #precipitationProbability: precipitationProbability,
      if (uvIndex != null) #uvIndex: uvIndex,
      if (cloudcover != null) #cloudcover: cloudcover,
      if (weathercode != null) #weathercode: weathercode,
    }),
  );
  @override
  WeatherHourlyRawData $make(CopyWithData data) => WeatherHourlyRawData(
    temperature: data.get(#temperature, or: $value.temperature),
    humidity: data.get(#humidity, or: $value.humidity),
    windSpeed: data.get(#windSpeed, or: $value.windSpeed),
    time: data.get(#time, or: $value.time),
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
  );

  @override
  WeatherHourlyRawDataCopyWith<$R2, WeatherHourlyRawData, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WeatherHourlyRawDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

