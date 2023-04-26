import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Components/Buttons/HxButton.dart';
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
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: [
                    Flexible(
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
                            title: 'Button Title',
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
                      title: 'Button Title',
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
