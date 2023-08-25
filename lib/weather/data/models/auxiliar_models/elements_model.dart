import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'auxiliar_models.dart';

class ElementModel {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final DateTime dtTxt;

  ElementModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.dtTxt,
  });

  ElementModel copyWith({
    int? dt,
    MainModel? main,
    List<WeatherModel>? weather,
    CloudsModel? clouds,
    WindModel? wind,
    int? visibility,
    double? pop,
    RainModel? rain,
    DateTime? dtTxt,
  }) {
    return ElementModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  Map<String, dynamic> toMap() {
    final model = <String, dynamic>{
      'dt': dt,
      'main': main.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'dtTxt': dtTxt.toIso8601String(),
    };
    return model;
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    final model = ElementModel(
      dt: map['dt'] == null ? 0 : map['dt'] * 1 as int,
      main: MainModel.fromMap(map['main'] as Map<String, dynamic>),
      weather: List<WeatherModel>.from(
        (map['weather'] as List<dynamic>).map<WeatherModel>(
          (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String, dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      visibility: map['visibility'] == null ? 0 : map['visibility'] * 1 as int,
      pop: map['pop'] == null ? 0.0 : map['pop'] * 1.0 as double,
      dtTxt: map['dtTxt'] == null
          ? DateTime.now()
          : DateTime.parse(map['dtTxt'] as String),
    );
    return model;
  }

  String toJson() => json.encode(toMap());

  factory ElementModel.fromJson(String source) =>
      ElementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ElementModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(covariant ElementModel other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.dtTxt == dtTxt;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        dtTxt.hashCode;
  }
}
