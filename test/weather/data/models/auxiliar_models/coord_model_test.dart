import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/coord_model.dart';

void main() {
  group('CoordModel', () {
    test('should create an instance correctly', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);

      expect(coordModel.lon, 10.0);
      expect(coordModel.lat, 20.0);
    });

    test('should copy an instance with new values', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final copiedModel = coordModel.copyWith(lon: 15.0);

      expect(copiedModel.lon, 15.0);
      expect(copiedModel.lat, 20.0);
    });

    test('should convert model to map and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final map = coordModel.toMap();
      final fromMapModel = CoordModel.fromMap(map);

      expect(fromMapModel, coordModel);
    });

    test('should convert model to JSON string and back', () {
      final coordModel = CoordModel(lon: 10.0, lat: 20.0);
      final jsonString = coordModel.toJson();
      final fromJsonModel = CoordModel.fromJson(jsonString);

      expect(fromJsonModel, coordModel);
    });

    test('should compare instances correctly', () {
      final coordModel1 = CoordModel(lon: 10.0, lat: 20.0);
      final coordModel2 = CoordModel(lon: 10.0, lat: 20.0);
      final coordModel3 = CoordModel(lon: 15.0, lat: 20.0);

      expect(coordModel1, coordModel2);
      expect(coordModel1.hashCode, coordModel2.hashCode);
      expect(coordModel1 != coordModel3, true);
    });
  });
}
