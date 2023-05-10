// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> authApi(String username, String password, Function callback,
    Function callbackError) async {
  // print('username $username password $password');
  var url = 'https://absbypassapi.onrender.com/login';

  Response? response;
  try {
    var dio = Dio();

    // Encode the username and password strings to Base64
    String credentials = base64.encode(utf8.encode('$username:$password'));

    response = await dio.post(url, data: {'authorization': credentials});
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
      print("login.dart/Else Error: ${e.message}");
      callbackError(e.message);
    }
  } catch (e) {
    print("Error in http call: ${e.toString()}");
    callbackError(e.toString());
  }
  return;
}

// Future<void> authApi(String username, String password, Function callback,
//     Function callbackError) async {
//   // print('username $username password $password');
//   var url = 'http://127.0.0.1:3000/login';

//   Response? response;
//   try {
//     var dio = Dio();
//     response = await dio.post(url,
//         data: {'username': username, 'password': password},
//         options: Options(headers: {'Content-Type': 'application/json'}));

//     // print("response: $response");

//     if (response.statusCode == 200) {
//       // storage.
//       await storage.write(key: 'HTTPSESSION', value: response.toString());
//       // await storage.write(key: 'USERNAME', value: username.toString());

//       callback(response.data.toString());
//     } else {
//       callbackError(response.data.toString());
//     }
//   } on DioError catch (e) {
//     if (e.response != null) {
//       // print("login.dart/Error response: ${e.response!.statusCode} ${e.response!.data}");
//       callbackError("${e.response!.statusCode} ${e.response!.data}");
//     } else {
//       // print("login.dart/Else Error: ${e.message}");
//       callbackError(e.message);
//     }
//   } catch (e) {
//     print("Error in http call: ${e.toString()}");
//     callbackError(e.toString());
//   }
//   return;
// }

/*To use this method, you can call it like this:

await authApi('your-username', 'your-password');
Replace https://example.com/login with the actual URL of your login endpoint, and 'your-username' and 'your-password' with your actual login credentials.

Once you have stored the PHPSESSID value in the device's storage, you can retrieve it for future use like this:

var phpSessionId = await storage.read(key: 'phpSessionId');
This will return the PHPSESSID value as a string, which you can then include in subsequent network requests by adding it to the Cookie header, like in the previous example. */
