// ignore_for_file: unused_field, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Components/Buttons/HxButton.dart';
import '../../../Components/Logo.dart';
import '../../../Components/api/api.dart';
import 'components/ButtonList.dart';

const storage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _name;
  late double _balance = 0.0;
  late String _id;
  late List _accountList = [];
  late String? _selectedAccount = null;

  Future<void> _loadData() async {
    final username = await storage.read(key: 'USERNAME');

    try {
      // ignore: use_build_context_synchronously
      var data = {
        "select":
            "ACCOUNT_NAME NAME, mphone, CON_MOB, CUST_ID, round(BALANCE_M,2) BALANCE",
        "from": "reginfo",
        "where": "mphone = $username"
      };
      String encodedData = json.encode(data);

      var response = await api(
          'POST',
          '/QUERY',
          encodedData,
          (error) => {
                if (kDebugMode) {print('Error in loading $error')}
              });

      var responseJson = response![0]; // Accessing first element of the list
      var regInfo = RegInfo.fromJson(responseJson);
      List? loadAccount = await _loadAccount(regInfo.cust_id);
      if (kDebugMode) {
        print("temp_response:>> $loadAccount");
      }

      setState(() {
        _name = regInfo.name;
        _balance = regInfo.balance;
        _id = regInfo.cust_id;
        _accountList = loadAccount ?? [];
      });
    } catch (e) {
      print('Error in loading $e');
    }
  }

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

  @override
  void initState() {
    super.initState();
    _balance = 0;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (_accountList.isNotEmpty) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MediaQuery.of(context).orientation == Orientation.landscape
                ? Row(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/images/hive.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn),
                          semanticsLabel: 'Logo',
                          width: (width / 2),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: SingleChildScrollView(
                              child: Column(children: [
                            HxButton(
                              title:
                                  // "Your Balance ${_balance.toStringAsFixed(2)}",
                                  "Your Balance ${_balance.toString()}",
                              isLarge: true,
                              colorful: true,
                              cornerRounded: 5,
                              subtitle: 'Click to see details',
                              icon: FontAwesomeIcons.fileInvoiceDollar,
                              onPressed: () {
                                // do something
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 25.0, horizontal: 0.0),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              fillColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.2),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  width: 0,
                                                ),
                                                gapPadding: 4.0,
                                              ),
                                              filled: true,
                                              prefixIcon: const Icon(
                                                  Icons.account_balance),
                                            ),
                                            hint: Text(_accountList.isEmpty
                                                ? "No Account Found"
                                                : "Select Account"),
                                            value: _selectedAccount,
                                            items: _accountList
                                                .map((map) =>
                                                    map['MPHONE'].toString())
                                                .toList()
                                                .map((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              print("Btn: $newValue");
                                              setState(() {
                                                _selectedAccount = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                                child: buttonListSection(context)),
                          ])),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      HxButton(
                        // title: "Your Balance ${_balance.toStringAsFixed(2)}",
                        title: "Your Balance ${_balance}",
                        isLarge: true,
                        colorful: true,
                        cornerRounded: 5,
                        subtitle: 'Click to see details',
                        icon: FontAwesomeIcons.fileInvoiceDollar,
                        onPressed: () {
                          // do something
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25.0, horizontal: 0.0),
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.2),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            width: 0,
                                          ),
                                          gapPadding: 4.0,
                                        ),
                                        filled: true,
                                        prefixIcon:
                                            const Icon(Icons.account_balance),
                                      ),
                                      hint: Text(_accountList.isEmpty
                                          ? "No Account Found"
                                          : "Select Account"),
                                      value: _selectedAccount,
                                      items: _accountList
                                          .map(
                                              (map) => map['MPHONE'].toString())
                                          .toList()
                                          .map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        print("Btn: $newValue");
                                        setState(() {
                                          _selectedAccount = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: buttonListSection(context),
                      )),
                    ])),
                  ),
          ],
        ),
      );
    } else {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoadingAnimationWidget.discreteCircle(
                size: 100,
                secondRingColor: Theme.of(context).colorScheme.primaryContainer,
                thirdRingColor: Theme.of(context).colorScheme.tertiary,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Logo(),
            ),
          ),
        ],
      );
    }
  }
}

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
