import 'package:track_weather/weather/domain/entities/weather_entity.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<WeatherEntity> getCurrentWeatherByName({
    required String name,
    required String country,
  });

  Future<List<WeatherEntity>> getForecastWeather({
    required double lat,
    required double lon,
  });
}
