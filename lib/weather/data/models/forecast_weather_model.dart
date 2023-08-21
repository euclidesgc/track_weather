import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'auxiliar_models/auxiliar_models.dart';

class ForecastWeatherModel {
  final String cod;
  final int message;
  final int cnt;
  final List<ElementModel> elements;
  final CityModel city;

  ForecastWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.elements,
    required this.city,
  });

  ForecastWeatherModel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ElementModel>? list,
    CityModel? city,
  }) {
    return ForecastWeatherModel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      elements: list ?? elements,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': elements.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory ForecastWeatherModel.fromMap(Map<String, dynamic> map) {
    return ForecastWeatherModel(
      cod: map['cod'] as String,
      message: map['message'] as int,
      cnt: map['cnt'] as int,
      elements: List<ElementModel>.from(
        (map['list'] as List<int>).map<ElementModel>(
          (x) => ElementModel.fromMap(x as Map<String, dynamic>),
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
    return 'ForecastWeatherModel(cod: $cod, message: $message, cnt: $cnt, list: $elements, city: $city)';
  }

  @override
  bool operator ==(covariant ForecastWeatherModel other) {
    if (identical(this, other)) return true;

    return other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.elements, elements) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        elements.hashCode ^
        city.hashCode;
  }
}
