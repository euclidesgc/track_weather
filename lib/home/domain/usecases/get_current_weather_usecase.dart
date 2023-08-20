import 'package:track_weather/home/domain/entities/weather_entity.dart';

import '../../respositories/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WeatherRepository repository;

  GetCurrentWeatherUsecase({required this.repository});

  Future<WeatherEntity> call({
    required double lat,
    required double lon,
  }) async {
    return await repository.getCurrentWeather(lat: lat, lon: lon);
  }
}
