// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import '../../../Components/api/login.dart';

class useLogin {
  String baseUrl = "http://10.140.9.126:3001/api";
  late String? userId;
  late String? token;
  late String? refreshToken;
  late BuildContext context;

  useLogin(this.context);

  // Login User
  Future<String?> login(String username, String password) async {
    Map jsonBody = {
      'username': username,
      'password': password,
    };
    String? localError = null;
    var response = await authApi(username, password, (error) {
      localError = error;
    });

    if (response) {
      // ignore: use_build_context_synchronously
      context.push("/loading");
    } else {
      return localError;
    }
  }
}
