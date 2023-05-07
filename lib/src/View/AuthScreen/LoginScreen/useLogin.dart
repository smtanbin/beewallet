// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../Components/api/login.dart';
//
// class useLogin {
//   String baseUrl = "http://10.140.9.126:3001/api";
//   late String? userId;
//   late String? token;
//   late String? refreshToken;
//   late BuildContext context;
//
//   useLogin(this.context);
//
//   // Login User
//   Future<String?> login(String username, String password) async {
//     String? localError;
//     var response = await authApi(username, password, (error) {
//       localError = error;
//     });
//
//     if (response) {
//       // ignore: use_build_context_synchronously
//       context.push("/loading");
//     } else {
//       return localError;
//     }
//     return null;
//   }
// }
