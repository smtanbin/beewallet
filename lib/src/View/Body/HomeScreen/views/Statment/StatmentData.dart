import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Components/Buttons/CustomSliverAppBar.dart';
import '../../../../../Components/api/api.dart';

class StatementViewScreen extends StatefulWidget {
  var response;

  StatementViewScreen({
    super.key,
    required this.response,
  });

  @override
  State<StatementViewScreen> createState() => _StatementViewScreenState();
}

class _StatementViewScreenState extends State<StatementViewScreen> {
  String accountNo = '';
  bool loading = false;
  String? error = null;

  Future accountCheck() async {
    setState(() => loading = true);
    try {
      var data = {"ac": "${accountNo.toString()}", "from": "", "to": ""};
      String encodedData = json.encode(data);

      final response = await api('/STATMENT', encodedData, (e) {
        setState(() => loading = false);
        setState(() => error = e.toString());
      });
      if (kDebugMode) {
        print("accountData => $response");
      }
      print("Success");
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
      title: accountNo.toUpperCase().toString(),
      icon: FontAwesomeIcons.fileInvoiceDollar,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: 'Account Number',
                ),
                onChanged: null,
                //     onChanged: (value) {
                //   accountNo = value;
                // },
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
                child: SizedBox(
                  width: double.infinity,
                  child: loading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton.icon(
                          onPressed: accountCheck,
                          icon: const Icon(Icons.search),
                          label: const Text('Search Account'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: const Size(50, 70),
                            foregroundColor: Theme.of(context)
                                .colorScheme
                                .inversePrimary, // set the color of the label text and icon
                          ),
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
