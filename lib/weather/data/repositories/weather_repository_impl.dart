import 'dart:developer';

import 'package:track_weather/weather/data/datasources/weather_datasource.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/utils/utils.dart';

import '../../domain/entities/location_entity.dart';
import '../../respositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource datasource;

  WeatherRepositoryImpl({required this.datasource});

  @override
  Future<WeatherEntity> getCurrentWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final weatherModel =
          await datasource.getCurrentWeather(lat: lat, lon: lon);

      final weatherEntity = WeatherEntity(
        location: LocationEntity(
          name: '${weatherModel.name}, ${weatherModel.sys.country}',
          lat: weatherModel.coord.lat,
          lon: weatherModel.coord.lon,
        ),
        weather: weatherModel.weather[0].main,
        time: Utils.convertTimestampToDateString(weatherModel.dt),
        description: weatherModel.weather[0].description,
        icon: weatherModel.weather[0].icon,
        temp: weatherModel.main.temp,
        feelsLike: weatherModel.main.feelsLike,
        tempMin: weatherModel.main.tempMin,
        tempMax: weatherModel.main.tempMax,
        pressure: weatherModel.main.pressure,
        humidity: weatherModel.main.humidity,
        wind: weatherModel.wind.speed,
      );

      return weatherEntity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WeatherEntity>> getForecastWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final forecastWeatherModel =
          await datasource.getForecastWeather(lat: lat, lon: lon);

      List<WeatherEntity> list = [];

      for (var element in forecastWeatherModel.elements) {
        final weatherEntity = WeatherEntity(
          location: LocationEntity(
            name:
                '${forecastWeatherModel.city.name}, ${forecastWeatherModel.city.country}',
            lat: forecastWeatherModel.city.coord.lat,
            lon: forecastWeatherModel.city.coord.lon,
          ),
          weather: element.weather[0].main,
          time: Utils.convertTimestampToDateString(element.dt),
          description: element.weather[0].description,
          icon: element.weather[0].icon,
          temp: element.main.temp,
          feelsLike: element.main.feelsLike,
          tempMin: element.main.tempMin,
          tempMax: element.main.tempMax,
          pressure: element.main.pressure,
          humidity: element.main.humidity,
          wind: element.wind.speed,
        );

        list.add(weatherEntity);
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeatherEntity> getCurrentWeatherByName(
      {required String name, required String country}) async {
    try {
      final weatherModel = await datasource.getCurrentWeatherByName(
          name: name, country: country);

      final weatherEntity = WeatherEntity(
        location: LocationEntity(
          name: '${weatherModel.name}, ${weatherModel.sys.country}',
          lat: weatherModel.coord.lat,
          lon: weatherModel.coord.lon,
        ),
        weather: weatherModel.weather[0].main,
        time: Utils.convertTimestampToDateString(weatherModel.dt),
        description: weatherModel.weather[0].description,
        icon: weatherModel.weather[0].icon,
        temp: weatherModel.main.temp,
        feelsLike: weatherModel.main.feelsLike,
        tempMin: weatherModel.main.tempMin,
        tempMax: weatherModel.main.tempMax,
        pressure: weatherModel.main.pressure,
        humidity: weatherModel.main.humidity,
        wind: weatherModel.wind.speed,
      );

      return weatherEntity;
    } catch (e) {
      rethrow;
    }
  }
}
