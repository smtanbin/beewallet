import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'baseurl.dart';

Future<bool> networkCheck() async {
  try {
    String baseurl = apiBaseUrl();
    var dio = Dio();
    final response = await dio.get('$baseurl/echo');
    String decodedData = utf8.decode(base64Decode(response.data));
    var jsonData = jsonDecode(decodedData);
    if (jsonData['massage'] == 'success') {
      return true;
    }
    if (kDebugMode) {
      print(jsonData['massage']);
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print("Error in api $e");
    }
    return false;
  }
}
