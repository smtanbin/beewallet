import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Components/CustomAppBar.dart';
import '../StaticLoadingPage.dart';
import 'HomeScreen/HomeScreen.dart';
import 'ProfileScreen/ProfileScreen.dart';
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
  late RegInfo reginfo; // initialize to a default value

  @override
  void initState() {
    super.initState();
    getHomePageData().then((RegInfo? _reginfo) {
      if (_reginfo != null) {
        setState(() {
          reginfo = _reginfo; // update the state with the received data
        });
      }
    });

    pageController.addListener(() {
      setState(() {
        _currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      reginfo.cust_id != null
          ? HomeScreen(
              name: reginfo.name,
              balance: reginfo.balance,
            )
          : StaticLoadingScreen(),
      const ProfileScreen(),
      const SettingsScreen()
    ];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primaryContainer,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad,
          );
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
        onPressed: () {},
        child: const Icon(Icons.qr_code_2_rounded),
      ),
    );
  }
}
