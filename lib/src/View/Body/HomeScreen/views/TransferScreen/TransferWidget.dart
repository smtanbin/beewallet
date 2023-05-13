import 'package:beewallet/src/Components/CustomAppBar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Components/Buttons/CustomSliverAppBar.dart';
import '../../../../../Components/Buttons/HxButton.dart';

class TransferWidget extends StatelessWidget {
  const TransferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      title: "Deposit",
      icon: FontAwesomeIcons.coins,
      children: [
        Padding(
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
              SizedBox(
                height: 1000,
              )
            ],
          ),
        )
      ],
    );
  }
}
