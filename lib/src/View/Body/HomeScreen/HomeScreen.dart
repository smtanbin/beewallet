import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Components/Buttons/HxButton.dart';
import '../../../Components/api/api.dart';
import '../HomeScreen/components/ButtonList.dart';

const storage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _name;
  late double _balance;
  late String _id;
  late List _accountList;

  Future<void> loadData() async {
    final username = await storage.read(key: 'USERNAME');
    const select =
        'ACCOUNT_NAME NAME, mphone, CON_MOB, CUST_ID, round(BALANCE_M,2) BALANCE';
    const from = 'reginfo';
    final where = 'mphone = $username';

    try {
      final response = await api(
        context,
        'POST',
        '/query',
        {'select': select, 'from': from, 'where': where},
        (error) => print(error),
      );

      if (response != null) {
        final id = response[0]['CUST_ID'];
        final accountList = await loadAccount(id);

        print('response ${response[0]}');
        print('accountList $_accountList');

        setState(() {
          _name = response[0]['NAME'];
          _balance = response[0]['BALANCE'];
          _id = id;
          _accountList = accountList!;
        });
      }
    } catch (e) {
      print('Error in loading $e');
    }
  }

  Future<List?> loadAccount(id) async {
    const select = 'mphone';
    const from = 'reginfo';
    final where = 'CUST_ID = $id';

    print('id = $id');

    try {
      final response = await api(
        context,
        'POST',
        '/query',
        {'select': select, 'from': from, 'where': where},
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
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("Data: $_balance");

    final double width = MediaQuery.of(context).size.width;

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
                                "Your Balance ${_balance.toStringAsFixed(2)}",
                            isLarge: true,
                            colorful: true,
                            cornerRounded: 5,
                            subtitle: 'Click to see details',
                            icon: FontAwesomeIcons.fileInvoiceDollar,
                            onPressed: () {
                              // do something
                            },
                          ),
                          accountList(context),
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
                      title: "Your Balance ${_balance.toStringAsFixed(2)}",
                      isLarge: true,
                      colorful: true,
                      cornerRounded: 5,
                      subtitle: 'Click to see details',
                      icon: FontAwesomeIcons.fileInvoiceDollar,
                      onPressed: () {
                        // do something
                      },
                    ),
                    accountList(context),
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
  }
}
