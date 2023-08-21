import 'dart:convert';

class RainModel {
  final double the3H;

  RainModel({
    required this.the3H,
  });

  RainModel copyWith({
    double? the3H,
  }) {
    return RainModel(
      the3H: the3H ?? this.the3H,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'the3H': the3H,
    };
  }

  factory RainModel.fromMap(Map<String, dynamic> map) {
    return RainModel(
      the3H: map['the3H'] == null ? 0.0 : map['the3H'] * 1.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RainModel.fromJson(String source) =>
      RainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RainModel(the3H: $the3H)';

  @override
  bool operator ==(covariant RainModel other) {
    if (identical(this, other)) return true;

    return other.the3H == the3H;
  }

  @override
  int get hashCode => the3H.hashCode;
}
