import 'package:flutter_test/flutter_test.dart';
import 'package:track_weather/weather/utils/utils.dart';

void main() {
  group('Utils', () {
    test(
        'convertTimestampToDateString should return formatted date string for given timestamp',
        () {
      const int timestamp = 1629646847;
      const String expectedDate = '22/08/2021 12:40:47';

      final String result = Utils.convertTimestampToDateString(timestamp);

      expect(result, expectedDate);
    });

    test(
        'convertTimestampToDateString should handle dates with single-digit day and month',
        () {
      const int timestamp = 1601646847;
      const String expectedDate = '02/10/2020 10:54:07';

      final String result = Utils.convertTimestampToDateString(timestamp);

      expect(result, expectedDate);
    });
  });
}
