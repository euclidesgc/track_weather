// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

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
    log(map.toString(), name: 'RainModel');
    
    return RainModel(
      the3H: map['the3H'] as double,
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

/*
import 'dart:convert';

class RainModel {
  final double the3H;

  RainModel({
    required this.the3H,
  });

  factory RainModel.fromRawJson(String str) =>
      RainModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RainModel.fromJson(Map<String, dynamic> json) => RainModel(
        the3H: json["3h"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "3h": the3H,
      };
}

*/