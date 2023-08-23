import 'dart:convert';

class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  WeatherModel copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherModel(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final model = WeatherModel(
      id: map['id'] == null ? 0 : map['id'] * 1 as int,
      main: map['main'] == null ? '' : map['main'] as String,
      description:
          map['description'] == null ? '' : map['description'] as String,
      icon: map['icon'] == null ? '' : map['icon'] as String,
    );
    return model;
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
