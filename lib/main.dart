import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:track_weather/home/data/repositories/weather_repository_impl.dart';
import 'package:track_weather/home/domain/usecases/get_current_weather_usecase.dart';
import 'package:track_weather/home/presentation/home_controller.dart';

import 'home/data/datasources/weather_datasource_impl.dart';
import 'home/presentation/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(
              controller: HomeController(
                usecase: GetCurrentWeatherUsecase(
                  repository: WeatherRepositoryImpl(
                    datasource: WeatherDatasourceImpl(
                      client: Dio(),
                    ),
                  ),
                ),
              ),
            ),
      },
    );
  }
}
