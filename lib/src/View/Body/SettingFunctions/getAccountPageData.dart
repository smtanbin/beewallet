import 'dart:convert';

import '../../../Components/api/api.dart';

Future<List?> loadAccount(id) async {
  try {
    var data = {
      "select":
          "ACCOUNT_NAME NAME, MPHONE,STATUS, REG_DATE, MATURITY_DATE, round(BALANCE_M,2) BALANCE",
      "from": "reginfo",
      "where": "CUST_ID = $id and REG_STATUS != 'R'"
    };
    String encodedData = json.encode(data);
    final response = await api(
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
