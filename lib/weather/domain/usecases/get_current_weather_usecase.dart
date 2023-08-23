import 'dart:developer';

import 'package:track_weather/weather/domain/entities/weather_entity.dart';

import '../../respositories/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WeatherRepository repository;

  GetCurrentWeatherUsecase({required this.repository});

  Future<WeatherEntity> call({
    required double lat,
    required double lon,
  }) async {
    try {
      return await repository.getCurrentWeather(lat: lat, lon: lon);
    } catch (e) {
      rethrow;
    }
  }
}
