import 'package:track_weather/home/data/models/current_weather_model.dart';

import '../models/forecast_weather_model.dart';

abstract interface class WeatherDatasource {
  Future<CurrentWeatherModel> getCurrentWeather({
    required double lat,
    required double lon,
  });

  Future<ForecastWeatherModel> getForecastWeather({
    required double lat,
    required double lon,
  });
}
