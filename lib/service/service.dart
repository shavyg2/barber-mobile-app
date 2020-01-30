library service;


import 'dart:convert';

import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_app/api/Api.dart';
import 'package:mobile_app/api/Request/Request.dart';
import 'package:mobile_app/models/models.dart';
import 'package:mobile_app/util/JsonApi.dart';
import 'package:mobile_app/util/json/parser.dart';
import 'package:http/http.dart' as http;


part "./User/UserService.dart";
part "./ApiResult.dart";