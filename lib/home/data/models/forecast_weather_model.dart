// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'auxiliar_models/auxiliar_models.dart';

class ForecastWeatherModel {
  final String cod;
  final int message;
  final int cnt;
  final List<ListElementModel> list;
  final CityModel city;

  ForecastWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  ForecastWeatherModel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListElementModel>? list,
    CityModel? city,
  }) {
    return ForecastWeatherModel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory ForecastWeatherModel.fromMap(Map<String, dynamic> map) {
    return ForecastWeatherModel(
      cod: map['cod'] as String,
      message: map['message'] as int,
      cnt: map['cnt'] as int,
      list: List<ListElementModel>.from(
        (map['list'] as List<int>).map<ListElementModel>(
          (x) => ListElementModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      city: CityModel.fromMap(map['city'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastWeatherModel.fromJson(String source) =>
      ForecastWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ForecastWeatherModel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }

  @override
  bool operator ==(covariant ForecastWeatherModel other) {
    if (identical(this, other)) return true;

    return other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }
}


/*
import 'dart:convert';

import 'auxiliar_models/auxiliar_models.dart';

class ForecastWeatherModel {
  final String cod;
  final int message;
  final int cnt;
  final List<ListElementModel> list;
  final CityModel city;

  ForecastWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory ForecastWeatherModel.fromRawJson(String str) =>
      ForecastWeatherModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) =>
      ForecastWeatherModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElementModel>.from(
            json["list"].map((x) => ListElementModel.fromJson(x))),
        city: CityModel.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
      };
}

*/