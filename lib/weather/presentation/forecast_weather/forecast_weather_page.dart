import 'package:flutter/material.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';

class ForecastWeatherPage extends StatefulWidget {
  const ForecastWeatherPage({super.key});

  @override
  State<ForecastWeatherPage> createState() => _ForecastWeatherPageState();
}

class _ForecastWeatherPageState extends State<ForecastWeatherPage> {
  @override
  Widget build(BuildContext context) {
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherEntity;

    initState() {
      super.initState();

      
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.location.name),
      ),
      body: Container(),
    );
  }
}
