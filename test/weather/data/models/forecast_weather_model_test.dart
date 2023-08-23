import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';
import 'package:track_weather/weather/data/models/forecast_weather_model.dart';

void main() {
  group('ForecastWeatherModel', () {
    test('should create an instance correctly', () {
      final elementModel = ElementModel(
        dt: 1629900000,
        main: MainModel(
            temp: 25.0,
            feelsLike: 27.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1000,
            humidity: 80),
        weather: [
          WeatherModel(
              id: 1, main: "Clear", description: "clear sky", icon: "01d")
        ],
        clouds: CloudsModel(all: 1),
        wind: WindModel(speed: 1.0),
        visibility: 10000,
        pop: 0.1,
        rain: RainModel(the3H: 5.0),
        dtTxt: DateTime.fromMillisecondsSinceEpoch(1629900000),
      );
      final cityModel = CityModel(
        id: 123,
        name: "City",
        coord: CoordModel(lon: 10.0, lat: 20.0),
        country: "US",
        population: 100000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final forecastWeatherModel = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      expect(forecastWeatherModel.cod, "200");
      expect(forecastWeatherModel.message, 0);
      expect(forecastWeatherModel.cnt, 5);
      expect(forecastWeatherModel.elements, [elementModel]);
      expect(forecastWeatherModel.city, cityModel);
    });

    test('should copy an instance with new values', () {
      final elementModel = ElementModel(
        dt: 1629900000,
        main: MainModel(
            temp: 25.0,
            feelsLike: 27.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1000,
            humidity: 80),
        weather: [
          WeatherModel(
              id: 1, main: "Clear", description: "clear sky", icon: "01d")
        ],
        clouds: CloudsModel(all: 1),
        wind: WindModel(speed: 1.0),
        visibility: 10000,
        pop: 0.1,
        rain: RainModel(the3H: 5.0),
        dtTxt: DateTime.fromMillisecondsSinceEpoch(1629900000),
      );
      final cityModel = CityModel(
        id: 123,
        name: "City",
        coord: CoordModel(lon: 10.0, lat: 20.0),
        country: "US",
        population: 100000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final forecastWeatherModel = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      final copiedModel = forecastWeatherModel.copyWith(cnt: 10);

      expect(copiedModel.cnt, 10);
      expect(copiedModel.cod, "200");
    });

    test('should convert model to map and back', () {
      final elementModel = ElementModel(
        dt: 1629900000,
        main: MainModel(
            temp: 25.0,
            feelsLike: 27.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1000,
            humidity: 80),
        weather: [
          WeatherModel(
              id: 1, main: "Clear", description: "clear sky", icon: "01d")
        ],
        clouds: CloudsModel(all: 1),
        wind: WindModel(speed: 1.0),
        visibility: 10000,
        pop: 0.1,
        rain: RainModel(the3H: 5.0),
        dtTxt: DateTime.fromMillisecondsSinceEpoch(1629900000),
      );
      final cityModel = CityModel(
        id: 123,
        name: "City",
        coord: CoordModel(lon: 10.0, lat: 20.0),
        country: "US",
        population: 100000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final forecastWeatherModel = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      final map = forecastWeatherModel.toMap();
      final fromMapModel = ForecastWeatherModel.fromMap(map);

      expect(fromMapModel, forecastWeatherModel);
    });

    test('should convert model to JSON string and back', () {
      final elementModel = ElementModel(
        dt: 1629900000,
        main: MainModel(
            temp: 25.0,
            feelsLike: 27.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1000,
            humidity: 80),
        weather: [
          WeatherModel(
              id: 1, main: "Clear", description: "clear sky", icon: "01d")
        ],
        clouds: CloudsModel(all: 1),
        wind: WindModel(speed: 1.0),
        visibility: 10000,
        pop: 0.1,
        rain: RainModel(the3H: 5.0),
        dtTxt: DateTime.fromMillisecondsSinceEpoch(1629900000),
      );
      final cityModel = CityModel(
        id: 123,
        name: "City",
        coord: CoordModel(lon: 10.0, lat: 20.0),
        country: "US",
        population: 100000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final forecastWeatherModel = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      final jsonString = forecastWeatherModel.toJson();
      final fromJsonModel = ForecastWeatherModel.fromJson(jsonString);

      expect(fromJsonModel, forecastWeatherModel);
    });

    test('should compare instances correctly', () {
      final elementModel = ElementModel(
        dt: 1629900000,
        main: MainModel(
            temp: 25.0,
            feelsLike: 27.0,
            tempMin: 20.0,
            tempMax: 30.0,
            pressure: 1000,
            humidity: 80),
        weather: [
          WeatherModel(
              id: 1, main: "Clear", description: "clear sky", icon: "01d")
        ],
        clouds: CloudsModel(all: 1),
        wind: WindModel(speed: 1.0),
        visibility: 10000,
        pop: 0.1,
        rain: RainModel(the3H: 5.0),
        dtTxt: DateTime.fromMillisecondsSinceEpoch(1629900000),
      );
      final cityModel = CityModel(
        id: 123,
        name: "City",
        coord: CoordModel(lon: 10.0, lat: 20.0),
        country: "US",
        population: 100000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      final forecastWeatherModel1 = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      final forecastWeatherModel2 = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 5,
        elements: [elementModel],
        city: cityModel,
      );

      final forecastWeatherModel3 = ForecastWeatherModel(
        cod: "200",
        message: 0,
        cnt: 10,
        elements: [elementModel],
        city: cityModel,
      );

      expect(forecastWeatherModel1, forecastWeatherModel2);
      expect(forecastWeatherModel1 != forecastWeatherModel3, true);
    });
  });
}
