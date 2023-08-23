import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  group('WindModel', () {
    test('should create an instance correctly', () {
      final wind = WindModel(speed: 10.0);
      expect(wind.speed, 10.0);
    });

    test('should copy an instance with new values', () {
      final wind = WindModel(speed: 10.0);
      final copiedWind = wind.copyWith(speed: 15.0);
      expect(copiedWind.speed, 15.0);
    });

    test('should convert model to map', () {
      final wind = WindModel(speed: 10.0);
      expect(wind.toMap(), {'speed': 10.0});
    });

    test('should create model from map', () {
      final map = {'speed': 10.0};
      final wind = WindModel.fromMap(map);
      expect(wind.speed, 10.0);
    });

    test('should create model from JSON string', () {
      const jsonString = '{"speed": 10.0}';
      final wind = WindModel.fromJson(jsonString);
      expect(wind.speed, 10.0);
    });

    test('should convert model to JSON string', () {
      final wind = WindModel(speed: 10.0);
      expect(wind.toJson(), '{"speed":10.0}');
    });

    test('should return correct string representation', () {
      final wind = WindModel(speed: 10.0);
      expect(wind.toString(), 'WindModel(speed: 10.0)');
    });

    test('should compare instances correctly', () {
      final wind1 = WindModel(speed: 10.0);
      final wind2 = WindModel(speed: 10.0);
      final wind3 = WindModel(speed: 15.0);
      expect(wind1, wind2);
      expect(wind1.hashCode, wind2.hashCode);
      expect(wind1 != wind3, true);
    });
  });
}
