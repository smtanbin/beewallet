import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// /*
// This method takes the httpMethod parameter as a string and uses a switch statement to select the appropriate HTTP method to use. The apiPath parameter is appended to the base URL of the API. The data parameter is encoded as JSON and passed as the request body for POST, UPDATE, and DELETE requests.

// The headers map includes the Cookie header with the PHPSESSID value set to your session ID.
// */

const storage = FlutterSecureStorage();
const baseUrl = 'http://127.0.0.1:3000';

Future<List?> api(BuildContext context, String httpMethod, String apiPath,
    Map<String, dynamic> data, Function callbackError) async {
  String? sessionid = await storage.read(key: 'HTTPSESSION');

  if (sessionid == null) {
    context.go('/login');
    callbackError("token not found");
    return null;
  }
  try {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    var endpoint = "$baseUrl/execute";
    // var dio = Dio(BaseOptions(
    //   baseUrl: baseUrl,
    //   headers: {
    //     'Authorization':
    //         'Bearer ${sessionid.substring(sessionid.indexOf(':') + 2, sessionid.length - 2)}'
    //   },
    // ));
    // var endpoint = baseUrl + apiPath;

    var reqData = [
      apiPath,
      "token:${sessionid.substring(sessionid.indexOf(':') + 2, sessionid.length - 2)}",
      "data:${data}"
    ];
    String base64ReqData = base64Encode(utf8.encode(reqData.join(';')));

    final response = await dio.post(endpoint, data: base64ReqData);
    String decodedData = utf8.decode(base64Decode(response.data));
    return jsonDecode(decodedData);
  } catch (e) {
    print("Error in api $e");
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

