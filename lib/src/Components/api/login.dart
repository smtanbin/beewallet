// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> authApi(String username, String password, Function callback,
    Function callbackError) async {
  try {
    var dio = Dio();

    // Encode the username and password strings to Base64
    print('username $username password $password');
    if (username == "" || password == "") {
      callbackError("Username Password can't be blank.");
      return;
    }

    String credentials = base64.encode(utf8.encode('$username:$password'));
    print("credentials: $credentials");
    const baseUrl = '';
    Response? response = await dio.post(
        // 'https://absbypassapi.onrender.com/login',
        'http://10.140.9.126:3000/login',
        data: {'authorization': credentials});

    print("response: $response");

    if (response.statusCode == 200) {
      // storage.
      await storage.write(key: 'HTTPSESSION', value: response.toString());
      await storage.write(key: 'USERNAME', value: username.toString());

      callback(response.data.toString());
    } else {
      callbackError(response.data.toString());
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print(
          "login.dart/Error response: ${e.response!.statusCode} ${e.response!.data}");
      callbackError("${e.response!.statusCode} ${e.response!.data}");
    } else {
      print("Error:[Response is null],"
          "Origin: login.dart, "
          "Type: [DioError catch], "
          "Body:[${e.error}], "
          "Error Massage:${e.message} ");
      callbackError(e.error.toString());
    }
  } catch (e) {
    print("Error in http call: ${e.toString()}");
    callbackError(e.toString());
  }
  return;
}
