import 'package:flutter/material.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/presentation/forecast_weather/forecast_weather_controller.dart';

class ForecastWeatherPage extends StatefulWidget {
  final ForecastWeatherController controller;

  const ForecastWeatherPage({super.key, required this.controller});

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  late WeatherEntity weather;

  @override
  void initState() {
    super.initState();
    weather = ModalRoute.of(context)!.settings.arguments as WeatherEntity;

    widget.controller.getForecastWeather(
      weather.location.lat,
      weather.location.lon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.location.name),
      ),
      body: Container(),
    );
  }
}
