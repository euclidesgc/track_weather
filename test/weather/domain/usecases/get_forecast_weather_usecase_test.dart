import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/domain/usecases/get_forecast_weather_usecase.dart';
import 'package:track_weather/weather/respositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetForecastWeatherUsecase usecase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetForecastWeatherUsecase(repository: mockRepository);
  });

  test('should get forecast weather from the repository', () async {
    final mockForecast = [
      const WeatherEntity.empty(),
      const WeatherEntity.empty()
    ];

    when(() => mockRepository.getForecastWeather(
        lat: any(named: 'lat'),
        lon: any(named: 'lon'))).thenAnswer((_) async => mockForecast);

    final result = await usecase.call(lat: 34.0, lon: 45.0);

    expect(result, mockForecast);
    verify(() => mockRepository.getForecastWeather(lat: 34.0, lon: 45.0))
        .called(1);
  });

  test('should throw an exception if the repository does', () async {
    when(() => mockRepository.getForecastWeather(
        lat: any(named: 'lat'),
        lon: any(named: 'lon'))).thenThrow(Exception('Failed to get weather'));

    expect(
        () async => await usecase.call(lat: 34.0, lon: 45.0), throwsException);
  });
}
