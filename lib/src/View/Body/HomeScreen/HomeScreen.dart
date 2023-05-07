import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Components/Buttons/HxButton.dart';
import '../../../Components/api/api.dart';
// import your API package

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = '';
  String _balance = '';
  List<dynamic> _accountList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final username = await storage.read(key: 'USERNAME');

    const select =
        'ACCOUNT_NAME NAME, mphone, CON_MOB, CUST_ID, round(BALANCE_M,2) BALANCE';
    const from = 'reginfo';
    final where = "mphone = '$username'";

    try {
      // ignore: use_build_context_synchronously
      List? _response = await api(
          context,
          'POST',
          '/query',
          {'select': select, 'from': from, 'where': where},
          (error) => {
                if (kDebugMode) {print('Error in loading $error')}
              });

      List<String>? response = _response![0];
      if (kDebugMode) {
        print("response:>> ${response}");
      }
      int custId = int.parse(response!['CUST_ID']);
      if (kDebugMode) {
        print("custId:>> $custId");
      }

      // final id = int.parse(response!['CUST_ID']);
      // if (kDebugMode) {
      //   print("ID $id");
      // }

      // final accountList = await _loadAccount(id);
      // print('accountList $_accountList');

      // setState(() {
      //   _name = response['NAME'];
      //   _balance = response['BALANCE'];
      //   _accountList = accountList!;
      // });
    } catch (e) {
      print('Error in loading $e');
    }
  }

  Future<List<dynamic>?> _loadAccount(int id) async {
    final _where = 'CUST_ID = $id';
    try {
      final response = await api(
        context,
        'POST',
        '/query',
        {'select': 'mphone', 'from': 'reginfo', 'where': _where},
        (error) => print(error),
      );
      return response;
    } catch (e) {
      print('Error in loading $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HxButton(
      title: "Your Balance ${_balance}",
      isLarge: true,
      colorful: true,
      cornerRounded: 5,
      subtitle: 'Click to see details',
      icon: FontAwesomeIcons.fileInvoiceDollar,
      onPressed: () {
        // do something
      },
    );
  }
}
