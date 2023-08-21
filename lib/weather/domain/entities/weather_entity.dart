import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class WeatherEntity extends Equatable {
  final LocationEntity location;
  final String weather;
  final String time;
  final String description;
  final String icon;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double wind;

  const WeatherEntity({
    required this.location,
    required this.weather,
    required this.time,
    required this.description,
    required this.icon,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.wind,
  });

  @override
  List<Object?> get props => [
        weather,
        time,
        description,
        icon,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        wind,
      ];
}
