import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/city_model.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/coord_model.dart';

void main() {
  group('CityModel', () {
    test('should create an instance correctly', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final cityModel = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      expect(cityModel.id, 1);
      expect(cityModel.name, "City");
      expect(cityModel.coord, coordModel);
      expect(cityModel.country, "Country");
      expect(cityModel.population, 10000);
      expect(cityModel.timezone, 3600);
      expect(cityModel.sunrise, 1629900000);
      expect(cityModel.sunset, 1629950000);
    });

    test('should copy an instance with new values', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final cityModel = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );
      final copiedModel = cityModel.copyWith(id: 2);

      expect(copiedModel.id, 2);
      expect(copiedModel.name, "City");
    });

    test('should convert model to map and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final cityModel = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );
      final map = cityModel.toMap();
      final fromMapModel = CityModel.fromMap(map);

      expect(fromMapModel, cityModel);
    });

    test('should convert model to JSON string and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final cityModel = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );
      final jsonString = cityModel.toJson();
      final fromJsonModel = CityModel.fromJson(jsonString);

      expect(fromJsonModel, cityModel);
    });

    test('should compare instances correctly', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final cityModel1 = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );
      final cityModel2 = CityModel(
        id: 1,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );
      final cityModel3 = CityModel(
        id: 2,
        name: "City",
        coord: coordModel,
        country: "Country",
        population: 10000,
        timezone: 3600,
        sunrise: 1629900000,
        sunset: 1629950000,
      );

      expect(cityModel1, cityModel2);
      expect(cityModel1.hashCode, cityModel2.hashCode);
      expect(cityModel1 != cityModel3, true);
    });
  });
}
