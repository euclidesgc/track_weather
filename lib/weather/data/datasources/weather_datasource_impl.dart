import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:track_weather/weather/data/models/current_weather_model.dart';
import 'package:track_weather/weather/data/models/forecast_weather_model.dart';
import 'package:track_weather/weather/errors/errors.dart';

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

      return CurrentWeatherModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw BadRequestError();
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedError();
        } else if (e.response!.statusCode == 404) {
          throw NotFoundError();
        } else if (e.response!.statusCode == 429) {
          throw LimitOfRequestsExceededError();
        } else {
          throw UnexpectedError();
        }
      } else {
        throw GetCurrentWeatherError();
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

      return ForecastWeatherModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw BadRequestError();
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedError();
        } else if (e.response!.statusCode == 404) {
          throw NotFoundError();
        } else if (e.response!.statusCode == 429) {
          throw LimitOfRequestsExceededError();
        } else {
          throw UnexpectedError();
        }
      } else {
        throw GetCurrentWeatherError();
      }
    } catch (e) {
      throw Exception('Error getting weather data');
    }
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeatherByName({
    required String name,
    required String country,
  }) async {
    final query = '$name,$country';
    final url = Urls.currentWeatherByNameUrl(query);

    try {
      final response = await client.get(url);

      return CurrentWeatherModel.fromMap(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw BadRequestError();
        } else if (e.response!.statusCode == 401) {
          throw UnauthorizedError();
        } else if (e.response!.statusCode == 404) {
          throw NotFoundError();
        } else if (e.response!.statusCode == 429) {
          throw LimitOfRequestsExceededError();
        } else {
          throw UnexpectedError();
        }
      } else {
        throw GetCurrentWeatherByNameError();
      }
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
