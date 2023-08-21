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
    final weatherModel = await datasource.getCurrentWeather(lat: lat, lon: lon);

    final weatherEntity = WeatherEntity(
      location: LocationEntity(
        name: '${weatherModel.name}, ${weatherModel.sys.country}}',
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
  }

  @override
  Future<WeatherEntity> getForecastWeather({
    required double lat,
    required double lon,
  }) {
    // TODO: implement getForecastWeather
    throw UnimplementedError();
  }
}
