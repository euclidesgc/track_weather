import 'package:track_weather/weather/domain/entities/weather_entity.dart';

import '../../respositories/weather_repository.dart';

class GetForecastWeatherUsecase {
  final WeatherRepository repository;

  GetForecastWeatherUsecase({required this.repository});

  Future<List<WeatherEntity>> call({
    required double lat,
    required double lon,
  }) async {
    return await repository.getForecastWeather(lat: lat, lon: lon);
  }
}
