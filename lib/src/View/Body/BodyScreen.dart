import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Components/CustomAppBar.dart';
import '../LoadingScreen/StaticLoadingPage.dart';
import 'AccountScreen/AccountScreen.dart';
import 'HomeScreen/HomeScreen.dart';
import 'SettingFunctions/getAccountPageData.dart';
import 'SettingFunctions/getHomeageData.dart';
import 'SettingsScreen.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({Key? key}) : super(key: key);

  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int _currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  late RegInfo reginfo =
      RegInfo(cust_id: '', name: '', balance: 0.0, con_mob: '', mphone: '');
  late List accountInfo = [];
  late List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    _initializeChildren();
    _initializePageController();
    children = [
      StaticLoadingScreen(),
      StaticLoadingScreen(),
      const SettingsScreen()
    ];
  }

  void _initializeChildren() async {
    getHomePageData().then((value) {
      if (value != null) {
        setState(() {
          reginfo = value; // update the state with the received data
        });
        return value.cust_id;
      }
      return null;
    }).then((value) {
      loadAccount(value).then((account) {
        if (account != null) {
          setState(() {
            accountInfo = account; // update the state with the received data
          });
        }
      }).then((_) {
        // chain another then() to wait for account data to be loaded
        setState(() {
          children = [
            Homescreen(
              balance: reginfo.balance,
              name: reginfo.name,
            ),
            AccountScreen(
              accounts: accountInfo,
            ),
            const SettingsScreen()
          ];
        });
      });
    });
  }

  void _initializePageController() {
    pageController.addListener(() {
      setState(() {
        _currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, //update,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(.5),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.creditCard),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {},
        child: const Icon(Icons.qr_code_2_rounded),
      ),
    );
  }
}
