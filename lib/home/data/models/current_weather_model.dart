// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'auxiliar_models/auxiliar_models.dart';

class CurrentWeatherModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  CurrentWeatherModel copyWith({
    CoordModel? coord,
    List<WeatherModel>? weather,
    String? base,
    MainModel? main,
    int? visibility,
    WindModel? wind,
    CloudsModel? clouds,
    int? dt,
    SysModel? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return CurrentWeatherModel(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      coord: CoordModel.fromMap(map['coord'] as Map<String, dynamic>),
      weather: List<WeatherModel>.from(
        (map['weather'] as List<dynamic>).map<WeatherModel>(
          (x) => WeatherModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: map['base'] as String,
      main: MainModel.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: WindModel.fromMap(map['wind'] as Map<String, dynamic>),
      clouds: CloudsModel.fromMap(map['clouds'] as Map<String, dynamic>),
      dt: map['dt'] as int,
      sys: SysModel.fromMap(map['sys'] as Map<String, dynamic>),
      timezone: map['timezone'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      cod: map['cod'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) =>
      CurrentWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentWeatherModel(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(covariant CurrentWeatherModel other) {
    if (identical(this, other)) return true;

    return other.coord == coord &&
        listEquals(other.weather, weather) &&
        other.base == base &&
        other.main == main &&
        other.visibility == visibility &&
        other.wind == wind &&
        other.clouds == clouds &&
        other.dt == dt &&
        other.sys == sys &&
        other.timezone == timezone &&
        other.id == id &&
        other.name == name &&
        other.cod == cod;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        clouds.hashCode ^
        dt.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode;
  }
}


/*
import 'dart:convert';

import 'auxiliar_models/auxiliar_models.dart';

class CurrentWeatherModel {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeatherModel.fromRawJson(String str) =>
      CurrentWeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherModel(
        coord: CoordModel.fromJson(json["coord"]),
        weather: List<WeatherModel>.from(
            json["weather"].map((x) => WeatherModel.fromJson(x))),
        base: json["base"],
        main: MainModel.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: WindModel.fromJson(json["wind"]),
        clouds: CloudsModel.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: SysModel.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

*/