import 'dart:convert';

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
    return WindModel(
      speed: map['speed'] == null ? 0.0 : map['speed'] * 1.0,
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
