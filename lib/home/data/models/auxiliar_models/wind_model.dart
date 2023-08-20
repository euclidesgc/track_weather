// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

class WindModel {
  final double speed;

  WindModel({
    required this.speed,
  });

  WindModel copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return WindModel(
      speed: speed ?? this.speed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
    };
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    log(map.toString(), name: 'WindModel');

    return WindModel(
      speed: map['speed'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WindModel(speed: $speed)';

  @override
  bool operator ==(covariant WindModel other) {
    if (identical(this, other)) return true;

    return other.speed == speed;
  }

  @override
  int get hashCode => speed.hashCode;
}
