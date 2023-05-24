import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
  String accountNumber = '';
  String name = '';
  String opendate = '';
  bool loading = false;
  String? error = null;

  get goRouter => null;

  @override
  void initState() {
    print("Statment Data response ${widget.response}");
  }

  Future accountCheck() async {
    setState(() => loading = true);
    try {
      var data = {"ac": "${accountNumber.toString()}", "from": "", "to": ""};
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
    var toDate;
    var fromDate;

    List<dynamic> listOfItems = widget.response[0].values.toList();
    accountNumber = listOfItems[0] as String;
    name = listOfItems[2] as String;
    opendate = listOfItems[3] as String;

    @override
    void initState() {
      if (widget.response == null) {
        // GoRouter.of(context).push('/statementScreen');
        GoRouter.of(context).pop();
      }
    }

    return CustomSliverAppBar(
      title: accountNumber.toString(),
      icon: FontAwesomeIcons.fileInvoiceDollar,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: TextEditingController(text: fromDate.toString()),
                decoration: InputDecoration(
                  labelText: 'From Date',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 0.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: TextEditingController(text: toDate.toString()),
                decoration: InputDecoration(
                  labelText: 'To Date',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 0.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // Do something with the date range
                },
                child: Text('Search'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
