import 'dart:convert';

import '../../../Components/api/api.dart';

Future<List?> _loadAccount(id) async {
  try {
    var data = {
      "select":
          "ACCOUNT_NAME NAME, mphone, CON_MOB, CUST_ID, round(BALANCE_M,2) BALANCE",
      "from": "reginfo",
      "where": "CUST_ID = ${int.parse(id)}"
    };
    String encodedData = json.encode(data);

    final response = await api(
      'POST',
      '/QUERY',
      encodedData,
      (error) => print(error),
    );

    return response;
  } catch (e) {
    print('Error in loading $e');
    return null;
  }
}
