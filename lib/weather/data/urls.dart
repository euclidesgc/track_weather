class Urls {
  static String currentWeatherUrl(
    double lat,
    double lon, {
    String lang = 'pt_br',
    String units = 'metric',
    String apiKey = const String.fromEnvironment('API_KEY'),
  }) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&lang=$lang&units=$units';
  }

  static String currentWeatherByNameUrl(
    String name, {
    String lang = 'pt_br',
    String units = 'metric',
    String apiKey = const String.fromEnvironment('API_KEY'),
  }) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$apiKey&lang=$lang&units=$units';
  }

  static String forecastWeatherUrl(
    double lat,
    double lon, {
    String lang = 'pt_br',
    String units = 'metric',
    int cnt = 5,
    String apiKey = const String.fromEnvironment('API_KEY'),
  }) {
    return 'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&lang=$lang&units=$units&cnt=$cnt';
  }

  static String iconUrl(String icon) {
    return 'http://openweathermap.org/img/w/$icon.png';
  }
}
