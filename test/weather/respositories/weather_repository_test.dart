import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/respositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
  });

  group('WeatherRepository Tests', () {
    test('getCurrentWeather returns WeatherEntity when given valid lat and lon',
        () async {
      const mockWeatherEntity = WeatherEntity.empty();

      when(() => mockRepository.getCurrentWeather(
          lat: any(named: 'lat'),
          lon: any(named: 'lon'))).thenAnswer((_) async => mockWeatherEntity);

      final result =
          await mockRepository.getCurrentWeather(lat: 34.0, lon: 45.0);

      expect(result, mockWeatherEntity);
      verify(() => mockRepository.getCurrentWeather(lat: 34.0, lon: 45.0))
          .called(1);
    });

    test(
        'getCurrentWeatherByName returns WeatherEntity when given valid name and country',
        () async {
      const mockWeatherEntity = WeatherEntity.empty();

      when(() => mockRepository.getCurrentWeatherByName(
              name: any(named: 'name'), country: any(named: 'country')))
          .thenAnswer((_) async => mockWeatherEntity);

      final result = await mockRepository.getCurrentWeatherByName(
          name: 'CityName', country: 'CountryName');

      expect(result, mockWeatherEntity);
      verify(() => mockRepository.getCurrentWeatherByName(
          name: 'CityName', country: 'CountryName')).called(1);
    });

    test(
        'getForecastWeather returns list of WeatherEntity when given valid lat and lon',
        () async {
      final mockForecast = [
        const WeatherEntity.empty(),
        const WeatherEntity.empty()
      ];

      when(() => mockRepository.getForecastWeather(
          lat: any(named: 'lat'),
          lon: any(named: 'lon'))).thenAnswer((_) async => mockForecast);

      final result =
          await mockRepository.getForecastWeather(lat: 34.0, lon: 45.0);

      expect(result, mockForecast);
      verify(() => mockRepository.getForecastWeather(lat: 34.0, lon: 45.0))
          .called(1);
    });
  });
}
