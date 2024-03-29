import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'baseurl.dart';

const storage = FlutterSecureStorage();
String baseUrl = apiBaseUrl();

Future<List?> api(String apiPath, String? data, Function callbackError) async {
  String? session = await storage.read(key: 'HTTPSESSION');

  if (session == null) {
    if (kDebugMode) {
      print("Error://api/> token not found");
    }
    callbackError("token not found");
    return null;
  }
  try {
    var dio = Dio();

    var reqData =
        '{"path":"${apiPath.toString().toUpperCase()}","token":$session,"data":${data.toString()}}';

    if (kDebugMode) {
      print("Pre Encryption Data:${reqData}");
    }

    String base64ReqData = base64Encode(utf8.encode(reqData));

    final response =
        await dio.post("$baseUrl/execute", data: {"hash": base64ReqData});

    String decodedData = utf8.decode(base64Decode(response.data));
    print("responce://> ${decodedData}");
    return jsonDecode(decodedData);
  } catch (e) {
    if (kDebugMode) {
      print("Error in api $e");
    }
    callbackError("phpSessionId not found");
    return null;
  }
}

Future<List?> api_test(
    String apiPath, String? data, Function callbackError) async {
  String? session = await storage.read(key: 'HTTPSESSION');

  if (session == null) {
    if (kDebugMode) {
      print("Error://api/> token not found");
    }
    callbackError("token not found");
    return null;
  }
  try {
    var dio = Dio();

    var reqData =
        '{"path":"${apiPath.toString().toUpperCase()}","token":$session,"data":${data.toString()}}';

    if (kDebugMode) {
      print("Pre Encryption Data:${reqData}");
    }

    final response =
        await dio.post("$baseUrl/debuging", data: {"hash": reqData});

    print("responce://> ${response.data}");
    return jsonDecode(response.data);
  } catch (e) {
    if (kDebugMode) {
      print("Error in api $e");
    }
    callbackError("phpSessionId not found");
    return null;
  }
}
