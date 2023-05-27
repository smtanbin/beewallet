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
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  State<StatementViewScreen> createState() => _StatementViewScreenState();
}

class _StatementViewScreenState extends State<StatementViewScreen> {
  String accountNumber = '';
  String name = '';
  String opendate = '';
  bool loading = false;
  String? error;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  void initState() {
    super.initState();

    List<dynamic> listOfItems = widget.response[0].values.toList();
    accountNumber = listOfItems[0] as String;
    name = listOfItems[2] as String;
    opendate = listOfItems[3] as String;
  }

  Future<void> getStatment() async {
    setState(() => loading = true);
    try {
      var data = {
        "ac": "${accountNumber.toString()}",
        "from": "${fromDate.toString()}",
        "to": "${toDate.toString()}"
      };
      String encodedData = json.encode(data);

      final response = await api_test('/STATMENT', encodedData, (e) {
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
      title: accountNumber.toString(),
      icon: FontAwesomeIcons.fileInvoiceDollar,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: fromDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      fromDate = selectedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: 'From Date',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 0.0,
                    ),
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
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: toDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      toDate = selectedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: 'To Date',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 0.0,
                    ),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                    : ElevatedButton.icon(
                        onPressed: getStatment,
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
            ],
          ),
        ),
      ],
    );
  }
}
