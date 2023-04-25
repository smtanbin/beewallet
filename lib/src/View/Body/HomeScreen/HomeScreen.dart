import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/ButtonList.dart';
import 'components/CarouselWidget.dart';
import 'components/imageWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const IconData money = IconData(0xe3f8, fontFamily: 'MaterialIcons');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: const [
          // imageWidget(width),
          // carouselWidget(width),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: ButtonList(),
          ),
        ],
      ),
    );
  }
}
