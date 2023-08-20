// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

class CloudsModel {
  final int all;

  CloudsModel({
    required this.all,
  });

  CloudsModel copyWith({
    int? all,
  }) {
    return CloudsModel(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory CloudsModel.fromMap(Map<String, dynamic> map) {
    log(map.toString(), name: 'CloudsModel');
    return CloudsModel(
      all: map['all'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudsModel.fromJson(String source) =>
      CloudsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CloudsModel(all: $all)';

  @override
  bool operator ==(covariant CloudsModel other) {
    if (identical(this, other)) return true;

    return other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}


/*
import 'dart:convert';

class CloudsModel {
  final int all;

  CloudsModel({
    required this.all,
  });

  factory CloudsModel.fromRawJson(String str) =>
      CloudsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

*/