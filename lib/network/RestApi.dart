import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_geolocator_example/models/supportLoginVO.dart';
import 'package:flutter_geolocator_example/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class RestApi {
  static final String securityKey = 'moJoENEt2021sECuriTYkEy';
  static var client = http.Client();

 static Future<SupportLoginVo> fetchSupportLogin(Map<String, String> params) async {
   debugPrint(params.toString());
    var response = await client.post(
      Uri.parse(SUPPORT_LOGIN_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "security_key": securityKey
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SupportLoginVo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to login');
    }
  }

  static void sendLatAndLongHitToServer(Map<String, String> params,String token) async {
    debugPrint(params.toString());
    var response = await client.post(
      Uri.parse(LATITUDE_LONGITUDE_URL),
      body: json.encode(params),
      headers: {
        'content-type': 'application/json',
        "token": token
      },
    );

    if (response.statusCode == 200) {
      debugPrint(response.body);
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to send data');
    }
  }
}

