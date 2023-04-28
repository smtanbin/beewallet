import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/* This method uses the http package to make a POST request to a login endpoint with the username and password parameters.
If the response status code is 200, the method extracts the set-cookie header from the response and looks for the PHPSESSID cookie. 

The FlutterSecureStorage package is used to store the PHPSESSID value in a secure way on the device.

Finally, a message is printed to the console indicating whether the login was successful or not.*/

const storage = FlutterSecureStorage();

Future<bool> authApi(
    String username, String password, Function callbackError) async {
  var url = Uri.parse(
      'https://agentbanking.standardbankbd.com/agentbank_v2/includes/login_check.php');
  try {
    var response = await http
        .post(url, body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      var headers = response.headers;
      var cookies = headers['set-cookie'];
      print("cookies: ${cookies}");

      var phpSessionId = cookies
          ?.split(';')
          .firstWhere((element) => element.startsWith('PHPSESSID='))
          .split('=')[1];
      print(phpSessionId);
      await storage.write(key: 'phpSessionId', value: phpSessionId);
      print('Login successful');
      return true;
    } else {
      print('Login failed');
      callbackError(response.statusCode);
    }
  } catch (e) {
    callbackError(e.toString());
  }
  return false;
}

/*To use this method, you can call it like this:

await authApi('your-username', 'your-password');
Replace https://example.com/login with the actual URL of your login endpoint, and 'your-username' and 'your-password' with your actual login credentials.

Once you have stored the PHPSESSID value in the device's storage, you can retrieve it for future use like this:

var phpSessionId = await storage.read(key: 'phpSessionId');
This will return the PHPSESSID value as a string, which you can then include in subsequent network requests by adding it to the Cookie header, like in the previous example. */
