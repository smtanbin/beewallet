import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:finWallet/src/Components/api/baseurl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
// const baseUrl = 'https://absbypassapi.onrender.com';
String baseUrl = apiBaseUrl();

Future<List?> api(String apiPath, String? data, Function callbackError) async {
  String? session = await storage.read(key: 'HTTPSESSION');

  if (session == null) {
    callbackError("token not found");
    return null;
  }
  try {
    var dio = Dio();

    var reqData =
        '{"path":"${apiPath.toString().toUpperCase()}","token":$session,"data":${data.toString()}}';
    String base64ReqData = base64Encode(utf8.encode(reqData));

    final response =
        await dio.post("$baseUrl/execute", data: {"hash": base64ReqData});
    String decodedData = utf8.decode(base64Decode(response.data));
    return jsonDecode(decodedData);
  } catch (e) {
    if (kDebugMode) {
      print("Error in api $e");
    }
    callbackError("phpSessionId not found");
    return null;
  }
}

// /*

// To use this method, you can call it like this:

// var response = await api(context,'POST', '/qurry', {'name': 'John', 'age': 30},(error){});
// print(response.body);
// This example makes a POST request to the /users endpoint with the name and age parameters set to John and 30, respectively. The response body is printed to the console.

// Note that you should replace https://example.com with the base URL of your API, and your-session-id-here with your actual session ID.

// */
