import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'auxiliar_models.dart';

class ListElementModel {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final RainModel rain;
  final DateTime dtTxt;

  ListElementModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.dtTxt,
  });

  ListElementModel copyWith({
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
    return ListElementModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      dtTxt: dtTxt ?? this.dtTxt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'main': main.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'rain': rain.toMap(),
      'dtTxt': dtTxt.millisecondsSinceEpoch,
    };
  }

  factory ListElementModel.fromMap(Map<String, dynamic> map) {
    return ListElementModel(
      dt: map['dt'] as int,
      main: MainModel.fromMap(map['main'] as Map<String, dynamic>),
      weather: List<WeatherModel>.from(
        (map['weather'] as List<int>).map<WeatherModel>(
          (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String, dynamic>),
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      pop: map['pop'] as double,
      rain: RainModel.fromMap(map['rain'] as Map<String, dynamic>),
      dtTxt: DateTime.fromMillisecondsSinceEpoch(map['dtTxt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListElementModel.fromJson(String source) =>
      ListElementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListElementModel(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, rain: $rain, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(covariant ListElementModel other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.rain == rain &&
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
        rain.hashCode ^
        dtTxt.hashCode;
  }
}
