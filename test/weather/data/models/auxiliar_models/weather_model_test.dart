import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  group('WeatherModel', () {
    test('should create an instance correctly', () {
      final weather = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      expect(weather.id, 1);
      expect(weather.main, 'Clear');
      expect(weather.description, 'Clear sky');
      expect(weather.icon, '01d');
    });

    test('should copy an instance with new values', () {
      final weather = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      final copiedWeather = weather.copyWith(main: 'Rain', icon: '10d');
      expect(copiedWeather.id, 1);
      expect(copiedWeather.main, 'Rain');
      expect(copiedWeather.description, 'Clear sky');
      expect(copiedWeather.icon, '10d');
    });

    test('should convert model to map', () {
      final weather = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      expect(weather.toMap(), {
        'id': 1,
        'main': 'Clear',
        'description': 'Clear sky',
        'icon': '01d'
      });
    });

    test('should create model from map', () {
      final map = {
        'id': 1,
        'main': 'Clear',
        'description': 'Clear sky',
        'icon': '01d'
      };
      final weather = WeatherModel.fromMap(map);
      expect(weather.id, 1);
      expect(weather.main, 'Clear');
      expect(weather.description, 'Clear sky');
      expect(weather.icon, '01d');
    });

    test('should create model from JSON string', () {
      const jsonString =
          '{"id":1,"main":"Clear","description":"Clear sky","icon":"01d"}';
      final weather = WeatherModel.fromJson(jsonString);
      expect(weather.id, 1);
      expect(weather.main, 'Clear');
      expect(weather.description, 'Clear sky');
      expect(weather.icon, '01d');
    });

    test('should convert model to JSON string', () {
      final weather = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      expect(weather.toJson(),
          '{"id":1,"main":"Clear","description":"Clear sky","icon":"01d"}');
    });

    test('should return correct string representation', () {
      final weather = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      expect(weather.toString(),
          'WeatherModel(id: 1, main: Clear, description: Clear sky, icon: 01d)');
    });

    test('should compare instances correctly', () {
      final weather1 = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      final weather2 = WeatherModel(
          id: 1, main: 'Clear', description: 'Clear sky', icon: '01d');
      final weather3 =
          WeatherModel(id: 2, main: 'Rain', description: 'Rainy', icon: '10d');
      expect(weather1, weather2);
      expect(weather1.hashCode, weather2.hashCode);
      expect(weather1 != weather3, true);
    });
  });
}
