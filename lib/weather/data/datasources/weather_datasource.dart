import 'package:track_weather/weather/data/models/current_weather_model.dart';

import '../models/forecast_weather_model.dart';

abstract interface class WeatherDatasource {
  Future<CurrentWeatherModel> getCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<CurrentWeatherModel> getCurrentWeatherByName({
    required String name,
    required String country,
  });

  Future<ForecastWeatherModel> getForecastWeather({
    required double lat,
    required double lon,
  });
}
