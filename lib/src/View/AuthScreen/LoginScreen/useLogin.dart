// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class useLogin {
  String baseUrl = "http://10.140.9.126:3001/api";
  late String? userId;
  late String? token;
  late String? refreshToken;
  late BuildContext context;

  useLogin(this.context);

  // Login User
  Future<String?> login(String username, String password) async {
    print("_Username:${username}, _Password:${password}");

    Map jsonBody = {
      'username': username,
      'password': password,
    };
    var response = await http.post(
      Uri.parse('$baseUrl/login/auth'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(jsonBody),
    );
    print("Response:// ${response.body}");

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      token = data['token'];
      refreshToken = data['refreshToken'];
      await saveUserAuthData(token!, refreshToken!);
      // ignore: use_build_context_synchronously
      context.pushReplacement("/loading");
      return null;
    } else {
      print("Error:// ${response.body}");
      return null;
    }
  }

  // Sign-Up User
  Future<String?> signUp(String name, String email, String password) async {
    var response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      var error = json.decode(response.body)['error'];
      return error;
    }
  }

  // Get User Token
  Future<String?> getToken() async {
    if (token != null) {
      return token;
    } else {
      final prefs = await SharedPreferences.getInstance();
      token = (prefs.getString('token'))!;
      return token;
    }
  }

  // Get User Id
  Future<String?> getUserId() async {
    if (userId != null) {
      return userId;
    } else {
      final prefs = await SharedPreferences.getInstance();
      userId = prefs.getString('userId')!;
      return userId;
    }
  }

  // Save User Authentication Data
  Future<void> saveUserAuthData(String token, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('userId', userId);
  }

  // Logout User
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userId');
    token = null;
    userId = null;
  }

  // Protected Route
  Future<bool> isAuthenticated() async {
    var token = await getToken();
    var userId = await getUserId();

    if (token != null && userId != null) {
      var response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
