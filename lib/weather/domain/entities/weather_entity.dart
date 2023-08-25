import 'location_entity.dart';

class WeatherEntity {
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

  const WeatherEntity.empty({
    this.location = const LocationEntity.empty(),
    this.weather = '',
    this.time = '',
    this.description = '',
    this.icon = '10d',
    this.temp = 0.0,
    this.feelsLike = 0.0,
    this.tempMin = 0.0,
    this.tempMax = 0.0,
    this.pressure = 0,
    this.humidity = 0,
    this.wind = 0.0,
  });

  @override
  bool operator ==(covariant WeatherEntity other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.weather == weather &&
        other.time == time &&
        other.description == description &&
        other.icon == icon &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.wind == wind;
  }

  @override
  int get hashCode {
    return location.hashCode ^
        weather.hashCode ^
        time.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        wind.hashCode;
  }
}
