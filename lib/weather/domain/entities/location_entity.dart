class LocationEntity {
  final String name;
  final double lat;
  final double lon;

  const LocationEntity({
    required this.name,
    required this.lat,
    required this.lon,
  });

  const LocationEntity.empty({
    this.name = '',
    this.lat = 0.0,
    this.lon = 0.0,
  });

  @override
  bool operator ==(covariant LocationEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && other.lat == lat && other.lon == lon;
  }

  @override
  int get hashCode => name.hashCode ^ lat.hashCode ^ lon.hashCode;
}
