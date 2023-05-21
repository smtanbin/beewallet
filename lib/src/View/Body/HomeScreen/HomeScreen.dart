// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Components/Buttons/HxButton.dart';
import 'components/ButtonList.dart';

class Homescreen extends StatelessWidget {
  late String name;
  late double balance = 0.0;
  Homescreen({super.key, required this.balance, required this.name});

  @override
  Widget build(BuildContext context) {
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
                                // "Your Balance ${_balance.toStringAsFixed(2)}",
                                "Your Balance ${balance.toString()}",
                            isLarge: true,
                            colorful: true,
                            cornerRounded: 5,
                            subtitle: 'Click to see details',
                            icon: FontAwesomeIcons.fileInvoiceDollar,
                            onPressed: () {
                              // do something
                            },
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
                      title: "Your Balance $balance",
                      isLarge: true,
                      colorful: true,
                      cornerRounded: 5,
                      subtitle: 'Click to see details',
                      icon: FontAwesomeIcons.fileInvoiceDollar,
                      onPressed: null,
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
  }
}
