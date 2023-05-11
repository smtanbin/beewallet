import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Components/Buttons/HxButton.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
                // perform search
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HxButton(
                title: 'Cancel',
                colorful: false,
                cornerRounded: 50,
                onPressed: () {},
                icon: Icons.cancel,
              ),
              const SizedBox(width: 20),
              HxButton(
                title: 'Next',
                colorful: true,
                icon: Icons.arrow_forward,
                cornerRounded: 50,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
