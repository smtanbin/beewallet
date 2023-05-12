import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../Components/api/api.dart';

const storage = FlutterSecureStorage();

class RegInfo {
  String name;
  String mphone;
  String con_mob;
  String cust_id;
  double balance;

  RegInfo({
    required this.name,
    required this.mphone,
    required this.con_mob,
    required this.cust_id,
    required this.balance,
  });

  factory RegInfo.fromJson(Map<String, dynamic> json) {
    return RegInfo(
      name: json['NAME'],
      mphone: json['MPHONE'],
      con_mob: json['CON_MOB'],
      cust_id: json['CUST_ID'],
      balance: double.parse(json['BALANCE']),
    );
  }
}

Future<RegInfo?> getHomePageData() async {
  final username = await storage.read(key: 'USERNAME');
  try {
    var data = {
      "select":
          "ACCOUNT_NAME NAME, mphone, CON_MOB, CUST_ID, round(BALANCE_M,2) BALANCE",
      "from": "reginfo",
      "where": "mphone = $username"
    };
    String encodedData = json.encode(data);

    var response = await api(
        '/QUERY',
        encodedData,
        (error) => {
              if (kDebugMode) {print('Error in loading $error')}
            });

    var responseJson = response![0]; // Accessing first element of the list
    RegInfo payload = RegInfo.fromJson(responseJson);
    return payload;
  } catch (e) {
    print('Error in loading $e');
    return null;
  }
}
