import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AccountCard.dart';

class AccountScreen extends StatelessWidget {
  final List<dynamic> accounts;
  const AccountScreen({Key? key, required this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            const Center(
                child: Text(
              "Account List",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 16),
            for (var account in accounts)
              AccountCard(
                name: account['NAME'],
                accountNo: account['MPHONE'],
                regDate: account['REG_DATE'],
                expDate: account['MATURITY_DATE'],
                status: account['STATUS'],
                balance: double.parse(account['BALANCE'].toString()),
              ),
          ],
        ),
      ),
    );
  }
}
