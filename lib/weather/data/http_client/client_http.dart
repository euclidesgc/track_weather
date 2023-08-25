// ignore_for_file: constant_identifier_names

abstract interface class ClientHttp {
  Future<ClientResponse> request({
    required String url,
    required HttpVerb verb,
    Map<String, dynamic> queryParams,
    dynamic body,
    Map<String, dynamic> headers,
  });
}

class ClientResponse {
  final int statusCode;
  final dynamic data;
  final dynamic header;

  ClientResponse({
    required this.statusCode,
    this.data,
    this.header,
  });
}

enum HttpVerb {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}
