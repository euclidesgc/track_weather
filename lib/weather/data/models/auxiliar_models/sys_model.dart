import 'dart:convert';

class SysModel {
  final String country;
  final int sunrise;
  final int sunset;

  SysModel({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  SysModel copyWith({
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return SysModel(
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      country: map['country'] == null ? '' : map['country'] as String,
      sunrise: map['sunrise'] == null ? 0 : map['sunrise'] * 1 as int,
      sunset: map['sunset'] == null ? 0 : map['sunset'] * 1 as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SysModel(country: $country, sunrise: $sunrise, sunset: $sunset)';

  @override
  bool operator ==(covariant SysModel other) {
    if (identical(this, other)) return true;

    return other.country == country &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode => country.hashCode ^ sunrise.hashCode ^ sunset.hashCode;
}
