import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:track_weather/weather/respositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetCurrentWeatherUsecase usecase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetCurrentWeatherUsecase(repository: mockRepository);
  });

  test('should get current weather from the repository', () async {
    const mockWeather = WeatherEntity.empty();

    when(() => mockRepository.getCurrentWeather(
        lat: any(named: 'lat'),
        lon: any(named: 'lon'))).thenAnswer((_) async => mockWeather);

    final result = await usecase.call(lat: 34.0, lon: 45.0);

    expect(result, mockWeather);
  });

  test('should throw an exception if the repository does', () async {
    when(() => mockRepository.getCurrentWeather(
        lat: any(named: 'lat'), lon: any(named: 'lon'))).thenThrow(Exception());

    expect(
        () async => await usecase.call(lat: 34.0, lon: 45.0), throwsException);
  });
}
