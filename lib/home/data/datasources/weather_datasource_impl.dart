import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:track_weather/home/data/models/current_weather_model.dart';
import 'package:track_weather/home/data/models/forecast_weather_model.dart';

import '../urls.dart';
import 'weather_datasource.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Dio client;

  WeatherDatasourceImpl({required this.client});

  @override
  Future<CurrentWeatherModel> getCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    final url = Urls.currentWeatherUrl(lat, lon);
    try {
      final response = await client.get(url);

      final result = CurrentWeatherModel.fromMap(response.data);
      return result;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw Exception('Bad request');
        } else if (e.response!.statusCode == 401) {
          throw Exception('Unauthorized');
        } else if (e.response!.statusCode == 404) {
          throw Exception('Not found');
        } else if (e.response!.statusCode == 429) {
          throw Exception('Limit of requests exceeded');
        } else {
          throw Exception('Unexpected error');
        }
      } else {
        throw Exception('Error getting weather data');
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw Exception('Unexpected error');
    }
  }

  @override
  Future<ForecastWeatherModel> getForecastWeather({
    required double lat,
    required double lon,
  }) async {
    final url = Urls.forecastWeatherUrl(lat, lon);
    try {
      final response = await client.get(url);

      return ForecastWeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw Exception('Bad request');
        } else if (e.response!.statusCode == 401) {
          throw Exception('Unauthorized');
        } else if (e.response!.statusCode == 404) {
          throw Exception('Not found');
        } else if (e.response!.statusCode == 429) {
          throw Exception('Limit of requests exceeded');
        } else {
          throw Exception('Unexpected error');
        }
      } else {
        throw Exception('Error getting weather data');
      }
    } catch (e) {
      throw Exception('Error getting weather data');
    }
  }
}
