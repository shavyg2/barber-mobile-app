import 'dart:convert';
import "package:http/http.dart" as http;

class Request {
  static http.Client _client = http.Client();
  static http.Client client = _client;

  static reset() {
    client = _client;
  }

  static Future<http.Response> put(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    headers = headers ?? {};
    headers.putIfAbsent("content-type", () => "application/json");
    final res = await client.put(url,
        headers: headers, body: jsonEncode(body), encoding: encoding);
    return res;
  }

  static Future<http.Response> post(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    headers = headers ?? {};
    headers.putIfAbsent("content-type", () => "application/json");
    var bodyString = jsonEncode(body);
    final res = await client.post(url,
        headers: headers, body: bodyString, encoding: encoding);
    return res;
  }
}
