import 'dart:developer';

import 'package:track_weather/weather/domain/entities/weather_entity.dart';

import '../../respositories/weather_repository.dart';

class GetCurrentWeatherByNameUsecase {
  final WeatherRepository repository;

  GetCurrentWeatherByNameUsecase({required this.repository});

  Future<WeatherEntity> call({
    required String name,
    required String country,
  }) async {
    try {
      return await repository.getCurrentWeatherByName(
          name: name, country: country);
    } catch (e) {
      rethrow;
    }
  }
}
