import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Components/Buttons/CustomSliverAppBar.dart';
import '../../../../../Components/Inputs/CustomInputBox.dart';
import '../../../../../Components/api/api.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  bool loading = false;
  String? error = null;

  String accountNo = '';
  final TextEditingController accountController = TextEditingController();
  void inputChanged() {
    setState(() {
      accountNo = accountController.text;
    });
  }

  @override
  void initState() {
    loading = true;
    super.initState();
    accountController.addListener(inputChanged);
    accountNo = accountController.text;
    setState(() => loading = true);
  }

//  "select":
//             "MPHONE acno, nvl((select name from reginfo where MPHONE = r.PMPHONE ),name) agent,ACCOUNT_NAME name,REG_DATE opdate ,STATUS status",

  Future accountCheck() async {
    try {
      var data = {
        "select":
            "MPHONE acno, PMPHONE agent,ACCOUNT_NAME name,REG_DATE opdate ,STATUS status",
        "from": "REGINFO r",
        "where": "MPHONE = '${accountNo.toString()}' AND REG_STATUS != 'R'"
      };
      String encodedData = json.encode(data);

      final response = await api('/QUERY', encodedData, (e) {
        setState(() => loading = false);
        setState(() => error = e.toString());
      });

      if (kDebugMode) {
        print("accountData => $response");
      }

      if (response![0] == null) {
        setState(() => loading = false);
        setState(() => error = "No Account Found");
      } else {
        context.push('/statementScreen/statementData', extra: response);
      }
    } catch (e) {
      setState(() => loading = false);
      setState(() => error = "No Account Found");
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      title: "Statment",
      icon: FontAwesomeIcons.fileInvoiceDollar,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomInputBox(
                    controller: accountController,
                    label: "Account Number",
                    onchange: (value) {
                      accountNo = value;
                    }),
              ),
              error == null
                  ? const SizedBox(
                      height: 40.0,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.triangleExclamation,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              error.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            )
                          ],
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                    : ElevatedButton.icon(
                        onPressed: accountCheck,
                        icon: const Icon(Icons.search),
                        label: const Text('Search Account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          minimumSize: const Size(50, 70),
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        )
      ],
    );
  }
}
