import 'package:flutter/foundation.dart';
import 'package:track_weather/weather/domain/usecases/get_current_weather_usecase.dart';

import '../../domain/entities/location_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/get_current_weather_by_name_usecase.dart';
import '../../utils/utils.dart';

class CurrentWeatherController {
  final GetCurrentWeatherUsecase byCoordUsecase;
  final GetCurrentWeatherByNameUsecase byNameUsecase;

  CurrentWeatherController({
    required this.byCoordUsecase,
    required this.byNameUsecase,
  });

  ValueNotifier<List<WeatherEntity>> locationsList =
      ValueNotifier<List<WeatherEntity>>([
    const WeatherEntity.empty(
      location: LocationEntity(
        name: 'Silverstone, UK',
        lat: 52.111180499643,
        lon: -1.1238033699862602,
      ),
    ),
    const WeatherEntity.empty(
      location: LocationEntity(
        name: 'Monte Carlo, Monaco',
        lat: 43.73747192762628,
        lon: 7.420516358490723,
      ),
    ),
    const WeatherEntity.empty(
      location: LocationEntity(
        name: 'Melbourne, Australia',
        lat: -37.81170805145812,
        lon: 144.96108285283623,
      ),
    ),
    const WeatherEntity.empty(
      location: LocationEntity(
        name: 'São Paulo, Brazil',
        lat: -23.56127249961532,
        lon: -46.65577521200185,
      ),
    )
  ]);

  ValueNotifier<List<WeatherEntity>> displaylocationsList =
      ValueNotifier<List<WeatherEntity>>([]);

  Future<WeatherEntity> getCurrentWeather(double lat, double lon) async {
    try {
      final weather = await byCoordUsecase.call(lat: lat, lon: lon);
      return weather;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateWeatherList() async {
    final isConnected = await Utils.verifyConnectivity();
    try {
      displaylocationsList.value = locationsList.value;

      if (isConnected == false) {
        return;
      }
      final updatedList = await Future.wait(
        locationsList.value.map(
          (location) async {
            final weather = await getCurrentWeather(
              location.location.lat,
              location.location.lon,
            );
            return WeatherEntity(
              location: location.location,
              description: weather.description,
              weather: weather.weather,
              time: weather.time,
              icon: weather.icon,
              temp: weather.temp,
              tempMin: weather.tempMin,
              tempMax: weather.tempMax,
              feelsLike: weather.feelsLike,
              humidity: weather.humidity,
              wind: weather.wind,
              pressure: weather.pressure,
            );
          },
        ),
      );

      displaylocationsList.value = updatedList;
      locationsList.value = updatedList;
    } catch (e) {
      rethrow;
    }
  }

  addNewLocation(String name, String country) async {
    try {
      final newWeather = await byNameUsecase.call(name: name, country: country);

      locationsList.value = [
        ...locationsList.value,
        newWeather,
      ];

      displaylocationsList.value = [...locationsList.value];
    } catch (e) {
      rethrow;
    }
  }

  void filterWeatherList(String searchTerm) {
    if (searchTerm.isEmpty) {
      displaylocationsList.value = locationsList.value;
      return;
    }

    List<WeatherEntity> filteredList =
        displaylocationsList.value.where((weather) {
      return weather.location.name
          .toLowerCase()
          .contains(searchTerm.toLowerCase());
    }).toList();

    displaylocationsList.value = filteredList;
  }
}
