import 'dart:convert';

import 'package:flutter/foundation.dart';

Future<dynamic> jsonParser(String json) async {
  final result = await compute(jsonDecode, json);
  return result;
}
