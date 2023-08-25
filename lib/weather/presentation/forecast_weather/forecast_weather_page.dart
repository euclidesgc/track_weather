import 'package:flutter/material.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/presentation/forecast_weather/forecast_weather_controller.dart';

import '../../errors/errors.dart';
import '../widgets/weather_tile.dart';

class ForecastWeatherPage extends StatelessWidget {
  final ForecastWeatherController controller;

  const ForecastWeatherPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final weather = ModalRoute.of(context)!.settings.arguments as WeatherEntity;

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.location.name),
      ),
      body: FutureBuilder(
        future: controller.getForecastWeather(
          weather.location.lat,
          weather.location.lon,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            if (snapshot.error is WeatherError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          } else {
            return ListView.builder(
              itemCount: controller.forecastList.value.length,
              itemBuilder: (context, index) {
                final forecast = controller.forecastList.value[index];
                return WeatherTile(
                  weather: forecast,
                  showLocation: false,
                );
              },
            );
          }
        },
      ),
    );
  }
}
