import 'package:flutter/material.dart';
import 'package:track_weather/weather/data/repositories/weather_repository_impl.dart';
import 'package:track_weather/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:track_weather/weather/presentation/forecast_weather/forecast_weather_controller.dart';

import 'weather/data/datasources/weather_datasource_impl.dart';
import 'weather/data/http_client/client_http_dio_impl.dart';
import 'weather/domain/usecases/get_current_weather_by_name_usecase.dart';
import 'weather/domain/usecases/get_forecast_weather_usecase.dart';
import 'weather/presentation/current_weather/current_weather_controller.dart';
import 'weather/presentation/current_weather/current_weather_page.dart';
import 'weather/presentation/forecast_weather/forecast_weather_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
      routes: {
        '/home': (context) => CurrentWeatherPage(
              controller: CurrentWeatherController(
                byNameUsecase: GetCurrentWeatherByNameUsecase(
                  repository: WeatherRepositoryImpl(
                    datasource: WeatherDatasourceImpl(
                      client: ClientHttpDioImpl(),
                    ),
                  ),
                ),
                byCoordUsecase: GetCurrentWeatherUsecase(
                  repository: WeatherRepositoryImpl(
                    datasource: WeatherDatasourceImpl(
                      client: ClientHttpDioImpl(),
                    ),
                  ),
                ),
              ),
            ),
        '/forecast_weather': (context) => ForecastWeatherPage(
              controller: ForecastWeatherController(
                usecase: GetForecastWeatherUsecase(
                  repository: WeatherRepositoryImpl(
                    datasource: WeatherDatasourceImpl(
                      client: ClientHttpDioImpl(),
                    ),
                  ),
                ),
              ),
            ),
      },
    );
  }
}
