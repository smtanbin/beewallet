import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen/ButtonList/ButtonList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const IconData money = IconData(0xe3f8, fontFamily: 'MaterialIcons');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: ButtonList(),
      ),
    );
  }
}
