abstract class WeatherError implements Exception {
  final String message;

  WeatherError(this.message);

  @override
  String toString() => message;
}

class ClientHttpRequestTypeError extends WeatherError {
  ClientHttpRequestTypeError([String message = "Invalid HTTP VERB"])
      : super(message);
}

class BadRequestError extends WeatherError {
  BadRequestError([String message = "Bad Request"]) : super(message);
}

class UnauthorizedError extends WeatherError {
  UnauthorizedError([String message = "Unauthorized"]) : super(message);
}

class NotFoundError extends WeatherError {
  NotFoundError([String message = "Not Found"]) : super(message);
}

class LimitOfRequestsExceededError extends WeatherError {
  LimitOfRequestsExceededError([String message = "Limit of Requests Exceeded"])
      : super(message);
}

class UnexpectedError extends WeatherError {
  UnexpectedError([String message = "Unexpected Error"]) : super(message);
}

class ServerError extends WeatherError {
  ServerError([String message = "Server Error"]) : super(message);
}

class GetCurrentWeatherError extends WeatherError {
  GetCurrentWeatherError(
      [String message = "Error getting current weather data"])
      : super(message);
}

class GetCurrentWeatherByNameError extends WeatherError {
  GetCurrentWeatherByNameError(
      [String message = "Error getting weather by name data"])
      : super(message);
}

class GetForecastWeatherError extends WeatherError {
  GetForecastWeatherError(
      [String message = "Error getting forecast weather data"])
      : super(message);
}
