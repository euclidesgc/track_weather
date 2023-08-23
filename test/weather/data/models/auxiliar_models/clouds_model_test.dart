import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/clouds_model.dart';

void main() {
  group('CloudsModel', () {
    test('should create an instance correctly', () {
      final cloudsModel = CloudsModel(all: 10);

      expect(cloudsModel.all, 10);
    });

    test('should copy an instance with new values', () {
      final cloudsModel = CloudsModel(all: 10);
      final copiedModel = cloudsModel.copyWith(all: 20);

      expect(copiedModel.all, 20);
    });

    test('should convert model to map and back', () {
      final cloudsModel = CloudsModel(all: 10);
      final map = cloudsModel.toMap();
      final fromMapModel = CloudsModel.fromMap(map);

      expect(fromMapModel, cloudsModel);
    });

    test('should convert model to JSON string and back', () {
      final cloudsModel = CloudsModel(all: 10);
      final jsonString = cloudsModel.toJson();
      final fromJsonModel = CloudsModel.fromJson(jsonString);

      expect(fromJsonModel, cloudsModel);
    });

    test('should compare instances correctly', () {
      final cloudsModel1 = CloudsModel(all: 10);
      final cloudsModel2 = CloudsModel(all: 10);
      final cloudsModel3 = CloudsModel(all: 20);

      expect(cloudsModel1, cloudsModel2);
      expect(cloudsModel1.hashCode, cloudsModel2.hashCode);
      expect(cloudsModel1 != cloudsModel3, true);
    });
  });
}
