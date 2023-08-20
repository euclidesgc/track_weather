// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

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
    log(map.toString(), name: 'SysModel');
    
    return SysModel(
      country: map['country'] as String,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
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


/*
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

  factory SysModel.fromRawJson(String str) =>
      SysModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

*/