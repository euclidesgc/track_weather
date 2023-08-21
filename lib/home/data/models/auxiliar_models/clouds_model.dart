import 'dart:convert';

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
