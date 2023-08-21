import 'package:flutter/foundation.dart';
import 'package:track_weather/weather/domain/usecases/get_current_weather_usecase.dart';

import '../../domain/entities/location_entity.dart';
import '../../domain/entities/weather_entity.dart';

class CurrentWeatherController {
  final GetCurrentWeatherUsecase usecase;

  CurrentWeatherController({required this.usecase});

  ValueNotifier<List<WeatherEntity>> locationsList =
      ValueNotifier<List<WeatherEntity>>([
    WeatherEntity(
      location: LocationEntity(
        name: 'Silverstone, UK',
        lat: 52.111180499643,
        lon: -1.1238033699862602,
      ),
      description: 'moderate rain',
      pressure: 1015,
      time: '0:00',
      weather: 'Rain',
      icon: '10d',
      temp: 298.48,
      tempMin: 297.56,
      tempMax: 300.05,
      feelsLike: 298.74,
      humidity: 64,
      wind: 0.62,
    ),
    WeatherEntity(
      location: LocationEntity(
        name: 'Monte Carlo, Monaco',
        lat: 43.73747192762628,
        lon: 7.420516358490723,
      ),
      description: 'moderate rain',
      weather: 'Rain',
      time: '0:00',
      icon: '10d',
      temp: 298.48,
      tempMin: 297.56,
      tempMax: 300.05,
      feelsLike: 298.74,
      humidity: 64,
      wind: 0.62,
      pressure: 1015,
    ),
    WeatherEntity(
      location: LocationEntity(
        name: 'Melbourne, Australia',
        lat: -37.81170805145812,
        lon: 144.96108285283623,
      ),
      description: 'moderate rain',
      weather: 'Rain',
      time: '0:00',
      icon: '10d',
      temp: 298.48,
      tempMin: 297.56,
      tempMax: 300.05,
      feelsLike: 298.74,
      humidity: 64,
      wind: 0.62,
      pressure: 1015,
    ),
    WeatherEntity(
      location: LocationEntity(
        name: 'São Paulo, Brazil',
        lat: -23.56127249961532,
        lon: -46.65577521200185,
      ),
      description: 'moderate rain',
      weather: 'Rain',
      time: '0:00',
      icon: '10d',
      temp: 298.48,
      tempMin: 297.56,
      tempMax: 300.05,
      feelsLike: 298.74,
      humidity: 64,
      wind: 0.62,
      pressure: 1015,
    )
  ]);

  Future<WeatherEntity> getCurrentWeather(double lat, double lon) async {
    final weather = await usecase.call(lat: lat, lon: lon);
    return weather;
  }

  updateWeatherList() async {
    final updatedList = await Future.wait(
      locationsList.value.map(
        (location) async {
          final weather = await getCurrentWeather(
            location.location.lat,
            location.location.lon,
          );
          return WeatherEntity(
            location: location.location,
            description: weather.description,
            weather: weather.weather,
            time: weather.time,
            icon: weather.icon,
            temp: weather.temp,
            tempMin: weather.tempMin,
            tempMax: weather.tempMax,
            feelsLike: weather.feelsLike,
            humidity: weather.humidity,
            wind: weather.wind,
            pressure: weather.pressure,
          );
        },
      ),
    );
    locationsList.value = updatedList;
  }
}
