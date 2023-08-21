import 'package:flutter/material.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/presentation/forecast_weather/forecast_weather_controller.dart';
import 'package:track_weather/weather/presentation/widgets/weather_tile.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    weather = ModalRoute.of(context)!.settings.arguments as WeatherEntity;

    widget.controller.getForecastWeather(
      weather.location.lat,
      weather.location.lon,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.location.name),
      ),
      body: ValueListenableBuilder<List<WeatherEntity>>(
        valueListenable: widget.controller.forecastList,
        builder: (context, value, child) => Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () async {
              widget.controller.getForecastWeather(
                weather.location.lat,
                weather.location.lon,
              );
            },
            child: ListView.builder(
              itemCount: widget.controller.forecastList.value.length,
              itemBuilder: (context, index) {
                final forecast = widget.controller.forecastList.value[index];
                return WeatherTile(
                  weather: forecast,
                  showLocation: false,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
