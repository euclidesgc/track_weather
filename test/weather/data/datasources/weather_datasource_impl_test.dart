import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:track_weather/weather/data/datasources/weather_datasource.dart';
import 'package:track_weather/weather/data/datasources/weather_datasource_impl.dart';
import 'package:track_weather/weather/data/http_client/client_http.dart';
import 'package:track_weather/weather/data/models/current_weather_model.dart';
import 'package:track_weather/weather/data/models/forecast_weather_model.dart';
import 'package:track_weather/weather/errors/errors.dart';

import '../../../fixtures/fixture_reader.dart';

class MockClientHttp extends Mock implements ClientHttp {}

void main() {
  late WeatherDatasource weatherDatasource;
  late MockClientHttp mockClientHttp;

  setUp(() {
    mockClientHttp = MockClientHttp();
    weatherDatasource = WeatherDatasourceImpl(client: mockClientHttp);
  });

  group('getCurrentWeather', () {
    test('should return CurrentWeatherModel when successful', () async {
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenAnswer(
        (_) async => ClientResponse(
          statusCode: 200,
          data: jsonDecode(fixture('current_weather.json')),
        ),
      );

      final result = await weatherDatasource.getCurrentWeather(
          lat: -37.814, lon: 144.9633);

      expect(result, isA<CurrentWeatherModel>());
    });

    test('should throw an error when DioException occurs', () async {
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(
        DioException(
          response: Response(
            statusCode: 400,
            requestOptions: RequestOptions(path: '', data: {'error': ''}),
          ),
          requestOptions: RequestOptions(path: '', data: {'error': ''}),
        ),
      );

      expect(
          () async => await weatherDatasource.getCurrentWeather(
              lat: -37.814, lon: 144.9633),
          throwsA(isA<BadRequestError>()));
    });

    test('should throw an error when other exception occurs', () async {
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(Exception());

      expect(
          () async => await weatherDatasource.getCurrentWeather(
              lat: -37.814, lon: 144.9633),
          throwsA(isA<Exception>()));
    });
  });

  group('getCurrentWeatherByName', () {
    test('should return CurrentWeatherModel when successful', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenAnswer(
        (_) async => ClientResponse(
          statusCode: 200,
          data: jsonDecode(fixture('current_weather.json')),
        ),
      );

      // Act
      final result = await weatherDatasource.getCurrentWeatherByName(
        name: 'Melbourne',
        country: 'AU',
      );

      // Assert
      expect(result, isA<CurrentWeatherModel>());
    });

    test('should throw an error when DioException occurs', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(
        DioException(
          response: Response(
            statusCode: 400,
            requestOptions: RequestOptions(path: '', data: {'error': ''}),
          ),
          requestOptions: RequestOptions(path: '', data: {'error': ''}),
        ),
      );

      // Act and Assert
      expect(
          () async => await weatherDatasource.getCurrentWeatherByName(
              name: 'Melbourne', country: 'AU'),
          throwsA(isA<BadRequestError>()));
    });

    test('should throw an error when other exception occurs', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(Exception());

      // Act and Assert
      expect(
          () async => await weatherDatasource.getCurrentWeatherByName(
              name: 'Melbourne', country: 'AU'),
          throwsA(isA<Exception>()));
    });
  });

  group('getForecastWeather', () {
    test('should return ForecastWeatherModel when successful', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenAnswer(
        (_) async => ClientResponse(
          statusCode: 200,
          data: jsonDecode(fixture('forecast_weather.json')),
        ),
      );

      // Act
      final result = await weatherDatasource.getForecastWeather(
          lat: -22.3708, lon: -41.7869);

      // Assert
      expect(result, isA<ForecastWeatherModel>());
    });

    test('should throw an error when DioException occurs', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(
        DioException(
          response: Response(
            statusCode: 400,
            requestOptions: RequestOptions(path: '', data: {'error': ''}),
          ),
          requestOptions: RequestOptions(path: '', data: {'error': ''}),
        ),
      );

      // Act and Assert
      expect(
          () async => await weatherDatasource.getForecastWeather(
              lat: -22.3708, lon: -41.7869),
          throwsA(isA<BadRequestError>()));
    });

    test('should throw an error when other exception occurs', () async {
      // Arrange
      when(() => mockClientHttp.request(
            url: any(named: 'url'),
            verb: HttpVerb.GET,
          )).thenThrow(Exception());

      // Act and Assert
      expect(
          () async => await weatherDatasource.getForecastWeather(
              lat: -22.3708, lon: -41.7869),
          throwsA(isA<Exception>()));
    });
  });
}
