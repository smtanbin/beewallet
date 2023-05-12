import 'package:flutter/material.dart';
import 'pages/DepositHero.dart';
import 'pages/FirstPage.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Column(
        children: [
          DepositHero(),
          FirstPage(),
        ],
      ),
    );
  }
}
