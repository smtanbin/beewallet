import 'dart:convert';
import 'package:beewallet/src/Components/api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Components/Buttons/CustomSliverAppBar.dart';

class AccountSearchScreen extends StatefulWidget {
  const AccountSearchScreen({Key? key}) : super(key: key);

  @override
  State<AccountSearchScreen> createState() => _AccountSearchScreenState();
}

class _AccountSearchScreenState extends State<AccountSearchScreen> {
  String accountNo = '';
  bool loading = false;
  String? error = null;

  Future accountCheck() async {
    setState(() => loading = true);
    try {
      String? username = await storage.read(key: 'USERNAME');
      if (username == null) {
        setState(() => loading = false);
        setState(() => error = "Agent not found");
        return null;
      }
      var data = {
        "select":
            "MPHONE acno,ACCOUNT_NAME name,Round((SELECT BALANCE_M - LIEN_M FROM REGINFO WHERE MPHONE = r.PMPHONE),2) balance",
        "from": "REGINFO r",
        "where":
            "MPHONE = '$accountNo' AND STATUS = 'A' and REG_STATUS != 'R' and PMPHONE = '$username'"
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
        if (kDebugMode) {
          print("Res => $response");
        }

        context.push(
            '/accountSearch/acno:response[acno]/name:response[name]/balance:response[balance]');
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
      title: "Deposit",
      icon: FontAwesomeIcons.coins,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'Account Number',
                  ),
                  onChanged: (value) {
                    accountNo = value;
                  },
                ),
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
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: loading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton.icon(
                          onPressed: accountCheck,
                          icon: const Icon(Icons.search),
                          label: const Text("Search Account"),
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
