import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  group('MainModel', () {
    test('should create an instance correctly', () {
      final mainModel = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      expect(mainModel.temp, 25.0);
      expect(mainModel.feelsLike, 27.0);
      expect(mainModel.tempMin, 20.0);
      expect(mainModel.tempMax, 30.0);
      expect(mainModel.pressure, 1000);
      expect(mainModel.humidity, 80);
    });

    test('should copy an instance with new values', () {
      final mainModel = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      final copiedModel = mainModel.copyWith(temp: 28.0);
      expect(copiedModel.temp, 28.0);
      expect(copiedModel.feelsLike, 27.0);
    });

    test('should convert model to map', () {
      final mainModel = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      final map = {
        'temp': 25.0,
        'feels_like': 27.0,
        'temp_min': 20.0,
        'temp_max': 30.0,
        'pressure': 1000,
        'humidity': 80,
      };
      expect(mainModel.toMap(), map);
    });

    test('should create model from map', () {
      final map = {
        'temp': 25.0,
        'feels_like': 27.0,
        'temp_min': 20.0,
        'temp_max': 30.0,
        'pressure': 1000,
        'humidity': 80,
      };
      final mainModel = MainModel.fromMap(map);
      expect(mainModel.temp, 25.0);
      expect(mainModel.feelsLike, 27.0);
      expect(mainModel.tempMin, 20.0);
      expect(mainModel.tempMax, 30.0);
      expect(mainModel.pressure, 1000);
      expect(mainModel.humidity, 80);
    });

    test('should create model from JSON string', () {
      const jsonString =
          '{"temp":25.0,"feels_like":27.0,"temp_min":20.0,"temp_max":30.0,"pressure":1000,"humidity":80}';
      final mainModel = MainModel.fromJson(jsonString);
      expect(mainModel.temp, 25.0);
      expect(mainModel.feelsLike, 27.0);
      expect(mainModel.tempMin, 20.0);
      expect(mainModel.tempMax, 30.0);
      expect(mainModel.pressure, 1000);
      expect(mainModel.humidity, 80);
    });

    test('should convert model to JSON string', () {
      final mainModel = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      const jsonString =
          '{"temp":25.0,"feels_like":27.0,"temp_min":20.0,"temp_max":30.0,"pressure":1000,"humidity":80}';
      expect(mainModel.toJson(), jsonString);
    });

    test('should compare instances correctly', () {
      final mainModel1 = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      final mainModel2 = MainModel(
        temp: 25.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      final mainModel3 = MainModel(
        temp: 30.0,
        feelsLike: 27.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1000,
        humidity: 80,
      );
      expect(mainModel1, mainModel2);
      expect(mainModel1.hashCode, mainModel2.hashCode);
      expect(mainModel1 != mainModel3, true);
    });
  });
}
