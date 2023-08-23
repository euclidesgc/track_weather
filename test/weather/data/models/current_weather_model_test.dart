import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';
import 'package:track_weather/weather/data/models/current_weather_model.dart';

void main() {
  group('CurrentWeatherModel', () {
    test('should create an instance correctly', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final weatherModel = WeatherModel(
          id: 1, main: "Clear", description: "clear sky", icon: "01d");
      final mainModel = MainModel(
          temp: 25.0,
          feelsLike: 27.0,
          tempMin: 20.0,
          tempMax: 30.0,
          pressure: 1000,
          humidity: 80);
      final windModel = WindModel(speed: 1.0);
      final cloudsModel = CloudsModel(all: 1);
      final sysModel = SysModel(
        country: "US",
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final currentWeatherModel = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      expect(currentWeatherModel.coord, coordModel);
      expect(currentWeatherModel.weather, [weatherModel]);
      expect(currentWeatherModel.base, "base");
      expect(currentWeatherModel.main, mainModel);
      expect(currentWeatherModel.visibility, 10000);
      expect(currentWeatherModel.wind, windModel);
      expect(currentWeatherModel.clouds, cloudsModel);
      expect(currentWeatherModel.dt, 1629900000);
      expect(currentWeatherModel.sys, sysModel);
      expect(currentWeatherModel.timezone, 3600);
      expect(currentWeatherModel.id, 123456);
      expect(currentWeatherModel.name, "City");
      expect(currentWeatherModel.cod, 200);
    });

    test('should copy an instance with new values', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final weatherModel = WeatherModel(
          id: 1, main: "Clear", description: "clear sky", icon: "01d");
      final mainModel = MainModel(
          temp: 25.0,
          feelsLike: 27.0,
          tempMin: 20.0,
          tempMax: 30.0,
          pressure: 1000,
          humidity: 80);
      final windModel = WindModel(speed: 1.0);
      final cloudsModel = CloudsModel(all: 1);
      final sysModel = SysModel(
        country: "US",
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final currentWeatherModel = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      final copiedModel = currentWeatherModel.copyWith(id: 789);

      expect(copiedModel.id, 789);
      expect(copiedModel.name, "City");
    });

    test('should convert model to map and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final weatherModel = WeatherModel(
          id: 1, main: "Clear", description: "clear sky", icon: "01d");
      final mainModel = MainModel(
          temp: 25.0,
          feelsLike: 27.0,
          tempMin: 20.0,
          tempMax: 30.0,
          pressure: 1000,
          humidity: 80);
      final windModel = WindModel(speed: 1.0);
      final cloudsModel = CloudsModel(all: 1);
      final sysModel = SysModel(
        country: "US",
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final currentWeatherModel = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      final map = currentWeatherModel.toMap();
      final fromMapModel = CurrentWeatherModel.fromMap(map);

      expect(fromMapModel, currentWeatherModel);
    });

    test('should convert model to JSON string and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final weatherModel = WeatherModel(
          id: 1, main: "Clear", description: "clear sky", icon: "01d");
      final mainModel = MainModel(
          temp: 25.0,
          feelsLike: 27.0,
          tempMin: 20.0,
          tempMax: 30.0,
          pressure: 1000,
          humidity: 80);
      final windModel = WindModel(speed: 1.0);
      final cloudsModel = CloudsModel(all: 1);
      final sysModel = SysModel(
        country: "US",
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final currentWeatherModel = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      final jsonString = currentWeatherModel.toJson();
      final fromJsonModel = CurrentWeatherModel.fromJson(jsonString);

      expect(fromJsonModel, currentWeatherModel);
    });

    test('should compare instances correctly', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final weatherModel = WeatherModel(
          id: 1, main: "Clear", description: "clear sky", icon: "01d");
      final mainModel = MainModel(
          temp: 25.0,
          feelsLike: 27.0,
          tempMin: 20.0,
          tempMax: 30.0,
          pressure: 1000,
          humidity: 80);
      final windModel = WindModel(speed: 1.0);
      final cloudsModel = CloudsModel(all: 1);
      final sysModel = SysModel(
        country: "US",
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final currentWeatherModel1 = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      final currentWeatherModel2 = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 123456,
        name: "City",
        cod: 200,
      );

      final currentWeatherModel3 = CurrentWeatherModel(
        coord: coordModel,
        weather: [weatherModel],
        base: "base",
        main: mainModel,
        visibility: 10000,
        wind: windModel,
        clouds: cloudsModel,
        dt: 1629900000,
        sys: sysModel,
        timezone: 3600,
        id: 789,
        name: "City",
        cod: 200,
      );

      expect(currentWeatherModel1, currentWeatherModel2);
      expect(currentWeatherModel1 != currentWeatherModel3, true);
    });
  });
}
