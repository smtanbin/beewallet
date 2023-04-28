import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

/* 
This method takes the httpMethod parameter as a string and uses a switch statement to select the appropriate HTTP method to use. The apiPath parameter is appended to the base URL of the API. The data parameter is encoded as JSON and passed as the request body for POST, UPDATE, and DELETE requests.

The headers map includes the Cookie header with the PHPSESSID value set to your session ID.
*/

Future<http.Response?> api(BuildContext context, String httpMethod,
    String apiPath, Map<String, dynamic> data, Function callbackError) async {
  String? phpSessionId = await storage.read(key: 'phpSessionId');
  if (phpSessionId == null) {
    context.go('/login');
    callbackError("phpSessionId not found");
    return null;
  }
  try {
    var url = Uri.parse('https://example.com/$apiPath');
    var headers = {'Cookie': 'PHPSESSID=your-session-id-here'};
    var body = jsonEncode(data);

    switch (httpMethod.toUpperCase()) {
      case 'GET':
        return await http.get(url, headers: headers);
      case 'POST':
        return await http.post(url, headers: headers, body: body);
      case 'UPDATE':
        return await http.put(url, headers: headers, body: body);
      case 'DELETE':
        return await http.delete(url, headers: headers, body: body);
      default:
        throw Exception('Invalid HTTP method');
    }
  } catch (e) {
    callbackError("phpSessionId not found");
    return null;
  }
}

/*

To use this method, you can call it like this:


var response = await makeNetworkRequest('POST', 'users', {'name': 'John', 'age': 30});
print(response.body);
This example makes a POST request to the /users endpoint with the name and age parameters set to John and 30, respectively. The response body is printed to the console.

Note that you should replace https://example.com with the base URL of your API, and your-session-id-here with your actual session ID.


*/

