import 'package:flutter/material.dart';
import 'pages/DepositHero.dart';
import 'pages/FirstPage.dart';
import 'pages/SecondPage.dart';

class TransferWidget extends StatefulWidget {
  const TransferWidget({Key? key}) : super(key: key);
  @override
  _TransferWidgetState createState() => _TransferWidgetState();
}

class _TransferWidgetState extends State<TransferWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DepositHero(),
          Expanded(
            child: IndexedStack(
              index: currentPageIndex,
              children: [
                FirstPage(onNextPressed: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                }),
                SecondPage(
                    //   onBackPressed: () {
                    //   setState(() {
                    //     currentPageIndex = 0;
                    //   });
                    // }
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
