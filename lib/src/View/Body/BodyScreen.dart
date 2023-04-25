import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HomeScreen/HomeScreen.dart';
import 'ProfileScreen/ProfileScreen.dart';
import 'SettingsScreen.dart';
import '../../Components/CustomAppBar.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyScreenState createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int _currentIndex = 0;
  late PageController pageController; // declare pageController

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: _currentIndex); // initialize pageController
  }

  final List<Widget> _children = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.background;
    double luminance = color.computeLuminance();
    color = luminance < 0.3
        ? Theme.of(context)
            .colorScheme
            .background
            .harmonizeWith(Theme.of(context).colorScheme.primary)
        : Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      backgroundColor: color,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _children[index];
        },
        itemCount: _children.length,
        controller: pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: WaterDropNavBar(
        bottomPadding: 10,
        waterDropColor: color,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        selectedIndex: _currentIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
            filledIcon: FontAwesomeIcons.creditCard,
            outlinedIcon: FontAwesomeIcons.creditCard,
          ),
          BarItem(
            filledIcon: Icons.info,
            outlinedIcon: Icons.info_outline,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_2_rounded),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
