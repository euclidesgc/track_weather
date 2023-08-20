import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/home/data/datasources/weather_datasource_impl.dart';
import 'package:track_weather/home/data/repositories/weather_repository_impl.dart';
import 'package:track_weather/home/domain/entities/weather_entity.dart';
import 'package:track_weather/home/domain/usecases/get_current_weather_usecase.dart';

void main() {
  test('shoud return a WeatherEntity', () async {
    //Arrange
    final Dio client = Dio();
    final datasource = WeatherDatasourceImpl(client: client);
    final repository = WeatherRepositoryImpl(datasource: datasource);
    final usecase = GetCurrentWeatherUsecase(repository: repository);

    //Act
    final result =
        await usecase.call(lat: -22.40132910502186, lon: -41.80453490509754);

    //Assert
    expect(result, isA<WeatherEntity>());
  });
}
