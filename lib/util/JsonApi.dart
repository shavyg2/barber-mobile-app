import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/util/doImmediately.dart';

class BaseRequest {
  String method;
  String url;
  Map<String, String> _headers;
  Map<String, String> get headers {
    return _headers ?? {};
  }

  set headers(Map<String, String> headers) {
    _headers = headers?? {};
  }

  Map<String, dynamic> body;
}

class JsonApi<T> {
  Client client;
  T Function(dynamic json) serialize;
  JsonApi({this.client, this.serialize});

  Future<Response> _response;

  dynamic _data;
  Response response;

  bool get hasData {
    return _data != null;
  }

  int get statusCode{
    return this.response?.statusCode??500;
  }

  T get data {
    if (serialize != null) {
      return serialize(_data);
    } else {
      return _data;
    }
  }

  bool get hasResponse {
    return response != null;
  }

  bool get isGood {
    return this.hasResponse &&
        response.statusCode >= 200 &&
        response.statusCode < 300;
  }

  bool get isBad {
    return !isGood;
  }

  bool get hasError {
    return !this.isGood;
  }

  String get message {
    return hasData ? _data["message"] : "";
  }

  bool get hasMessage {
    return message.isNotEmpty;
  }

  Future<void> _makeRequest(BaseRequest request) async {
    _response = _response ??
        doImmediately<Future<Response>>(() async {
          final url = request.url;

          request.headers.putIfAbsent("content-type", () {
            return "application/json";
          });

          switch (request.method.toLowerCase()) {
            case "get":
              return client.get(request.url, headers: request.headers);
            case "put":
              return client.put(request.url,
                  headers: request.headers, body: jsonEncode(request.body));
            case "post":
              return client.post(request.url,
                  headers: request.headers, body: jsonEncode(request.body));
            case "patch":
              return client.patch(request.url,
                  headers: request.headers, body: jsonEncode(request.body));
            case "delete":
              return client.delete(request.url, headers: request.headers);
            default:
              throw "unknown method ${request.method}";
          }
        });

    final res = await _response.catchError((_) {
      return null;
    });

    response = res;

    if (response == null) {
      return;
    }

    if (res.body != null && res.body.isNotEmpty) {
      try {
        _data = jsonDecode(res.body);
      } catch (e) {}
    }
  }

  static Future<JsonApi<T>> get<T>(
      {String url,
      Map<String, String> headers,
      T Function(dynamic) serialize}) async {
    final client = getContainer().findByName<Client>('client');
    final api = JsonApi<T>(client: client, serialize: serialize);

    await api._makeRequest(BaseRequest()
      ..url = url
      ..method = "get"
      ..headers = headers);

    return api;
  }

  static Future<JsonApi<T>> delete<T>(
      {String url,
      Map<String, String> headers,
      T Function(dynamic) serialize}) async {
    final client = getContainer().findByName<Client>('client');
    final api = JsonApi<T>(client: client, serialize: serialize);

    await api._makeRequest(BaseRequest()
      ..url = url
      ..method = "delete"
      ..headers = headers);

    return api;
  }

  static Future<JsonApi<T>> put<T>(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      T Function(dynamic) serialize}) async {
    final client = getContainer().findByName<Client>('client');
    final api = JsonApi<T>(client: client, serialize: serialize);

    if (headers == null) {
      headers = {};
    }

    await api._makeRequest(BaseRequest()
      ..url = url
      ..method = "put"
      ..headers = headers
      ..body = body);

    return api;
  }

  static Future<JsonApi<T>> post<T>(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      T Function(dynamic) serialize}) async {
    final client = getContainer().findByName<Client>('client');
    final api = JsonApi<T>(client: client, serialize: serialize);

    await api._makeRequest(BaseRequest()
      ..url = url
      ..method = "post"
      ..headers = headers
      ..body = body);

    return api;
  }

  static Future<JsonApi<T>> patch<T>(
      {String url,
      Map<String, String> headers,
      Map<String, dynamic> body,
      T Function(dynamic) serialize}) async {
    final client = getContainer().findByName<Client>('client');
    final api = JsonApi<T>(client: client, serialize: serialize);

    await api._makeRequest(BaseRequest()
      ..url = url
      ..method = "patch"
      ..headers = headers
      ..body = body);

    return api;
  }
}
