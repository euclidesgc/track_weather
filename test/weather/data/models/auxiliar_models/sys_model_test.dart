import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/data/models/auxiliar_models/auxiliar_models.dart';

void main() {
  group('SysModel', () {
    
    test('should create an instance correctly', () {
      final sys =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      expect(sys.country, 'BR');
      expect(sys.sunrise, 1617182400);
      expect(sys.sunset, 1617225600);
    });

    
    test('should copy an instance with new values', () {
      final sys =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      final copiedSys = sys.copyWith(country: 'US');
      expect(copiedSys.country, 'US');
      expect(copiedSys.sunrise, 1617182400);
      expect(copiedSys.sunset, 1617225600);
    });

    
    test('should convert model to map', () {
      final sys =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      expect(sys.toMap(),
          {'country': 'BR', 'sunrise': 1617182400, 'sunset': 1617225600});
    });

    
    test('should create model from map', () {
      final map = {
        'country': 'BR',
        'sunrise': 1617182400,
        'sunset': 1617225600
      };
      final sys = SysModel.fromMap(map);
      expect(sys.country, 'BR');
      expect(sys.sunrise, 1617182400);
      expect(sys.sunset, 1617225600);
    });

    
    test('should create model from JSON string', () {
      const jsonString =
          '{"country":"BR","sunrise":1617182400,"sunset":1617225600}';
      final sys = SysModel.fromJson(jsonString);
      expect(sys.country, 'BR');
      expect(sys.sunrise, 1617182400);
      expect(sys.sunset, 1617225600);
    });

    
    test('should convert model to JSON string', () {
      final sys =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      expect(sys.toJson(),
          '{"country":"BR","sunrise":1617182400,"sunset":1617225600}');
    });

    
    test('should return correct string representation', () {
      final sys =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      expect(sys.toString(),
          'SysModel(country: BR, sunrise: 1617182400, sunset: 1617225600)');
    });

    
    test('should compare instances correctly', () {
      final sys1 =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      final sys2 =
          SysModel(country: 'BR', sunrise: 1617182400, sunset: 1617225600);
      final sys3 =
          SysModel(country: 'US', sunrise: 1617192400, sunset: 1617235600);
      expect(sys1, sys2);
      expect(sys1.hashCode, sys2.hashCode);
      expect(sys1 != sys3, true);
    });
  });
}
