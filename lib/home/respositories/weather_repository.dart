import 'package:track_weather/home/domain/entities/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<WeatherEntity> getForecastWeather({
    required double lat,
    required double lon,
  });
}
