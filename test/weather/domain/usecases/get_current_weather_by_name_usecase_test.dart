import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:track_weather/weather/domain/entities/weather_entity.dart';
import 'package:track_weather/weather/domain/usecases/get_current_weather_by_name_usecase.dart';
import 'package:track_weather/weather/respositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetCurrentWeatherByNameUsecase usecase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetCurrentWeatherByNameUsecase(repository: mockRepository);
  });

  test('should get current weather by name from the repository', () async {
    const mockWeather = WeatherEntity.empty();

    when(() => mockRepository.getCurrentWeatherByName(
        name: any(named: 'name'),
        country: any(named: 'country'))).thenAnswer((_) async => mockWeather);

    final result = await usecase.call(name: 'London', country: 'UK');

    expect(result, mockWeather);
  });

  test('should throw an exception if the repository does', () async {
    when(() => mockRepository.getCurrentWeatherByName(
        name: any(named: 'name'),
        country: any(named: 'country'))).thenThrow(Exception());

    expect(() async => await usecase.call(name: 'London', country: 'UK'),
        throwsException);
  });
}
