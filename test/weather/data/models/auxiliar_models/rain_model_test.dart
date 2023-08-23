import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  group('RainModel', () {
    test('should create an instance correctly', () {
      final rain = RainModel(the3H: 5.0);
      expect(rain.the3H, 5.0);
    });

    test('should copy an instance with new values', () {
      final rain = RainModel(the3H: 5.0);
      final copiedRain = rain.copyWith(the3H: 10.0);
      expect(copiedRain.the3H, 10.0);
    });

    test('should convert model to map', () {
      final rain = RainModel(the3H: 5.0);
      expect(rain.toMap(), {'the3H': 5.0});
    });

    test('should create model from map', () {
      final map = {'the3H': 5.0};
      final rain = RainModel.fromMap(map);
      expect(rain.the3H, 5.0);
    });

    test('should create model from JSON string', () {
      const jsonString = '{"the3H":5.0}';
      final rain = RainModel.fromJson(jsonString);
      expect(rain.the3H, 5.0);
    });

    test('should convert model to JSON string', () {
      final rain = RainModel(the3H: 5.0);
      expect(rain.toJson(), '{"the3H":5.0}');
    });

    test('should return correct string representation', () {
      final rain = RainModel(the3H: 5.0);
      expect(rain.toString(), 'RainModel(the3H: 5.0)');
    });

    test('should compare instances correctly', () {
      final rain1 = RainModel(the3H: 5.0);
      final rain2 = RainModel(the3H: 5.0);
      final rain3 = RainModel(the3H: 10.0);
      expect(rain1, rain2);
      expect(rain1.hashCode, rain2.hashCode);
      expect(rain1 != rain3, true);
    });
  });
}
