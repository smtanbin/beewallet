import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../Components/Buttons/HxButton.dart';
import '../../../../Components/Buttons/MetroButton.dart';
import '../../../../Components/Buttons/customButton.dart';

Widget btngroup(context) {
  return Column(
    children: [
      HxButton(title: '1', icon: FontAwesomeIcons.vault, onPressed: () {})
    ],
  );
}

Widget buttonListSection(context) {
  return Wrap(
    children: <Widget>[
      customHxButton(
          title: 'Deposit',
          subtitle: "Add balance to your wallet.",
          iconData: FontAwesomeIcons.coins,
          onPressed: () {
            GoRouter.of(context).push('/transferMoney');
          }),
      customHxButton(
          title: 'Withdraw',
          subtitle: "Add balance to your wallet.",
          iconData: FontAwesomeIcons.circleDollarToSlot,
          onPressed: () {}),
      customHxButton(
          title: 'Transfer',
          subtitle: "Add balance to your wallet.",
          iconData: FontAwesomeIcons.moneyBillTransfer,
          onPressed: () {}),
      customHxButton(
          title: 'Bill',
          subtitle: "Add balance to your wallet.",
          iconData: FontAwesomeIcons.faucetDrip,
          onPressed: () {}),
    ],
  );
}

Widget customHxButton(
    {required String title,
    required String? subtitle,
    required iconData,
    required VoidCallback onPressed}) {
  return Column(
    children: [
      const SizedBox(height: 5),
      HxButton(
          title: title,
          subtitle: subtitle,
          icon: iconData,
          cornerRounded: 25,
          onPressed: onPressed),
      const SizedBox(height: 5),
    ],
  );
}
