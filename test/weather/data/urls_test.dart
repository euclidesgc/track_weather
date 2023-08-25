import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/urls.dart';

void main() {
  const apiKey = 'YOUR_API_KEY_HERE';

  group('Urls', () {
    test('currentWeatherUrl should return the correct URL', () {
      final result = Urls.currentWeatherUrl(40.0, 50.0, apiKey: apiKey);
      const expectedUrl =
          'weather?lat=40.0&lon=50.0&appid=$apiKey&lang=pt_br&units=metric';

      expect(result, expectedUrl);
    });

    test('currentWeatherByNameUrl should return the correct URL', () {
      final result = Urls.currentWeatherByNameUrl('London', apiKey: apiKey);
      const expectedUrl =
          'weather?q=London&appid=$apiKey&lang=pt_br&units=metric';

      expect(result, expectedUrl);
    });

    test('forecastWeatherUrl should return the correct URL', () {
      final result = Urls.forecastWeatherUrl(40.0, 50.0, apiKey: apiKey);
      const expectedUrl =
          'forecast?lat=40.0&lon=50.0&appid=$apiKey&lang=pt_br&units=metric&cnt=5';

      expect(result, expectedUrl);
    });

    test('iconUrl should return the correct URL', () {
      final result = Urls.iconUrl('10d');
      const expectedUrl = 'http://openweathermap.org/img/w/10d.png';

      expect(result, expectedUrl);
    });
  });
}
