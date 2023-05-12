import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Components/Buttons/HxButton.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Account Number',
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: HxButton(
              title: 'Search Account',
              colorful: true,
              icon: Icons.search,
              cornerRounded: 50,
              onPressed: () {
                context.go('/transferMoney/informationPage/cscadc');
              },
            ),
          ),
        ],
      ),
    );
  }
}
