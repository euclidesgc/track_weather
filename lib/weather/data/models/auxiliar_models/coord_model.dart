import 'dart:convert';

class CoordModel {
  final double lon;
  final double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  });

  CoordModel copyWith({
    double? lon,
    double? lat,
  }) {
    return CoordModel(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordModel.fromJson(String source) =>
      CoordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CoordModel(lon: $lon, lat: $lat)';

  @override
  bool operator ==(covariant CoordModel other) {
    if (identical(this, other)) return true;

    return other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}
