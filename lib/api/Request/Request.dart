import 'dart:convert';
import 'package:angel_container_generator/angel_container_generator.dart';
import "package:http/http.dart" as http;


@contained
class Request {
  

  http.Client client;

  Request(this.client);





  Future<http.Response> put(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    headers = headers ?? {};
    headers.putIfAbsent("content-type", () => "application/json");
    final res = await client.put(url,
        headers: headers, body: jsonEncode(body), encoding: encoding);
    return res;
  }

  Future<http.Response> post(String url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) async {
    headers = headers ?? {};
    headers.putIfAbsent("content-type", () => "application/json");
    var bodyString = jsonEncode(body);
    final res = await client.post(url,
        headers: headers, body: bodyString, encoding: encoding);
    return res;
  }
}
