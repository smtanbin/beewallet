import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Components/CustomAppBar.dart';
import 'HomeScreen/HomeScreen.dart';
import 'ProfileScreen/ProfileScreen.dart';
import 'SettingsScreen.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({Key? key}) : super(key: key);

  @override
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int _currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  _BodyScreenState() {}

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      const HomeScreen(),
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
