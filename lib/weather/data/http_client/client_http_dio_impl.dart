import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../errors/errors.dart';
import 'client_http.dart';

class ClientHttpDioImpl implements ClientHttp {
  final List<Interceptor>? interceptors;
  final String? baseUrl;

  ClientHttpDioImpl({
    this.interceptors,
    this.baseUrl = const String.fromEnvironment('BASE_URL'),
  });

  @override
  Future<ClientResponse> request({
    required String url,
    required HttpVerb verb,
    Map<String, dynamic>? queryParams,
    body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    Dio dio = DioForNative(BaseOptions(baseUrl: baseUrl ?? ''));

    if (interceptors != null && interceptors!.isNotEmpty) {
      dio.interceptors.addAll(interceptors!);
    }

    final defaultHeaders = headers?.cast<String, dynamic>() ?? {}
      ..addAll(_getDefaultHeaders());

    final defaultOptions = options ??
        Options(
          headers: defaultHeaders,
        );

    late Response response;

    try {
      switch (verb) {
        case HttpVerb.GET:
          response = await dio.get(
            url,
            queryParameters: queryParams,
            options: defaultOptions,
          );
          break;
        case HttpVerb.POST:
          response = await dio.post(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PUT:
          response = await dio.put(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.PATCH:
          response = await dio.patch(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        case HttpVerb.DELETE:
          response = await dio.delete(
            url,
            data: body,
            options: defaultOptions,
          );
          break;
        default:
          throw ClientHttpRequestTypeError();
      }
    } on DioException catch (error) {
      if (error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.statusMessage;
        final path = error.response!.requestOptions.path;
        log('🔴 Error: StatusCode - $statusCode - Path: $path');

        switch (error.response!.statusCode) {
          case 400:
            throw BadRequestError();
          case 401:
            throw UnauthorizedError();
          case 404:
            throw NotFoundError();
          case 429:
            throw LimitOfRequestsExceededError();
          case 500:
            throw ServerError();
          default:
            throw UnexpectedError(message ?? '');
        }
      } else {
        throw UnexpectedError();
      }
    } catch (error, stack) {
      log(
        '🔴 Error - Client Http Request Error',
        error: error,
        stackTrace: stack,
      );

      throw UnexpectedError(verb.name);
    }
    return _handleResponse(response);
  }

  ClientResponse _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        log('✅ ${response.realUri} - StatusCode: ${response.statusCode}');
        return ClientResponse(
          statusCode: response.statusCode!,
          data: response.data,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      case 204:
        log('✅ ${response.realUri} - StatusCode: ${response.statusCode}');
        return ClientResponse(
          statusCode: response.statusCode!,
          data: null,
          header: response.headers.isEmpty
              ? null
              : Map<String, dynamic>.from(response.headers.map),
        );
      default:
        log('🔴 Error - Unexpected ERROR - StatusCode: ${response.statusCode}');
        throw UnexpectedError(response.requestOptions.path);
    }
  }

  static Map<String, String> _getDefaultHeaders() {
    return {
      "accept": "application/json, text/plain, */*",
      "content-type": "application/json",
    };
  }
}
