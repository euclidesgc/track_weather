import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  late WeatherModel weatherModel;
  late MainModel mainModel;
  late DateTime testDate;
  late CloudsModel cloudsModel;
  late WindModel windModel;
  late RainModel rainModel;
  late ElementModel elementModel;
  final dtSample = DateTime.now();

  setUp(() {
    testDate = dtSample;

    weatherModel = WeatherModel(
      id: 1,
      main: "Clear",
      description: "clear sky",
      icon: "01d",
    );

    mainModel = MainModel(
      temp: 25.0,
      feelsLike: 27.0,
      tempMin: 20.0,
      tempMax: 30.0,
      pressure: 1000,
      humidity: 80,
    );

    cloudsModel = CloudsModel(all: 1);
    windModel = WindModel(speed: 1.0);
    rainModel = RainModel(the3H: 0.5);

    elementModel = ElementModel(
      dt: 1,
      main: mainModel,
      weather: [weatherModel],
      clouds: cloudsModel,
      wind: windModel,
      visibility: 10000,
      pop: 0.1,
      rain: rainModel,
      dtTxt: dtSample,
    );
  });

  group('ElementModel', () {
    test('should create an instance correctly', () {
      expect(elementModel.dt, 1);
      expect(elementModel.main, mainModel);
      expect(elementModel.weather, [weatherModel]);
      expect(elementModel.clouds, cloudsModel);
      expect(elementModel.wind, windModel);
      expect(elementModel.visibility, 10000);
      expect(elementModel.pop, 0.1);
      expect(elementModel.rain, rainModel);
      expect(elementModel.dtTxt, testDate);
    });

    test('should copy an instance with new values', () {
      final copiedModel = elementModel.copyWith(dt: 2);

      expect(copiedModel.dt, 2);
      expect(copiedModel.main, mainModel);
    });

/*
Expected: ElementModel:<ElementModel(dt: 1, main: MainModel(temp: 25.0, feelsLike: 27.0, tempMin: 20.0, tempMax: 30.0, pressure: 1000, humidity: 80), weather: [WeatherModel(id: 1, main: Clear, description: clear sky, icon: 01d)], clouds: CloudsModel(all: 1), wind: WindModel(speed: 1.0), visibility: 10000, pop: 0.1, rain: RainModel(the3H: 0.5), dtTxt: 2023-08-23 04:04:13.117577)>
  Actual: ElementModel:<ElementModel(dt: 1, main: MainModel(temp: 25.0, feelsLike: 27.0, tempMin: 20.0, tempMax: 30.0, pressure: 1000, humidity: 80), weather: [WeatherModel(id: 1, main: Clear, description: clear sky, icon: 01d)], clouds: CloudsModel(all: 1), wind: WindModel(speed: 1.0), visibility: 10000, pop: 0.1, rain: RainModel(the3H: 0.5), dtTxt: 2023-08-23 04:04:13.117)>
*/

    test('should convert model to map and back', () {
      final map = elementModel.toMap();
      final fromMapModel = ElementModel.fromMap(map);

      expect(fromMapModel, elementModel);
    });

    test('should convert model to JSON string and back', () {
      final jsonString = elementModel.toJson();
      final fromJsonModel = ElementModel.fromJson(jsonString);

      expect(fromJsonModel, elementModel);
    });

    test('should compare instances correctly', () {
      final elementModel1 = ElementModel(
        dt: 1,
        main: mainModel,
        weather: [weatherModel],
        clouds: cloudsModel,
        wind: windModel,
        visibility: 10000,
        pop: 0.1,
        rain: rainModel,
        dtTxt: testDate,
      );

      final elementModel2 = ElementModel(
        dt: 1,
        main: mainModel,
        weather: [weatherModel],
        clouds: cloudsModel,
        wind: windModel,
        visibility: 10000,
        pop: 0.1,
        rain: rainModel,
        dtTxt: testDate,
      );
      final elementModel3 = elementModel1.copyWith(dt: 3);

      expect(elementModel1, elementModel2);
      expect(elementModel1 != elementModel3, true);
    });
  });
}
