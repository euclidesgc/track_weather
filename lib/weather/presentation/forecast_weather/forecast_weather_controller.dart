import 'package:flutter/foundation.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/get_forecast_weather_usecase.dart';

class ForecastWeatherController {
  final GetForecastWeatherUsecase usecase;

  ForecastWeatherController({required this.usecase});

  ValueNotifier<List<WeatherEntity>> forecastList =
      ValueNotifier<List<WeatherEntity>>([]);

  getForecastWeather(double lat, double lon) async {
    final listWeather = await usecase.call(lat: lat, lon: lon);
    forecastList.value = listWeather;
  }
}
