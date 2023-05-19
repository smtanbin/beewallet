import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../Components/Accordion.dart';
import '../../../../Components/Buttons/HxButton.dart';

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
      Accordion(
        title: "Fund Transfer",
        isExpanded: true,
        children: [
          customHxButton(
              title: 'Deposit',
              subtitle: "Add balance to any account.",
              iconData: FontAwesomeIcons.coins,
              onPressed: () {
                GoRouter.of(context).push('/accountSearch');
              }),
          customHxButton(
              title: 'Withdraw',
              subtitle: "Withdraw balance from your account.",
              iconData: FontAwesomeIcons.circleDollarToSlot,
              onPressed: null),
          customHxButton(
              title: 'Transfer',
              subtitle: "Transfer balance to other account.",
              iconData: FontAwesomeIcons.moneyBillTransfer,
              onPressed: null),
        ],
      ),
      Accordion(
        title: "Enquiry",
        isExpanded: false,
        children: [
          customHxButton(
              title: 'Statement',
              subtitle: "Get statement of any account.",
              iconData: FontAwesomeIcons.fileInvoiceDollar,
              onPressed: () {
                GoRouter.of(context).push('/statementScreen');
              }),
          customHxButton(
              title: 'Bill',
              subtitle: "Collect PDB/RAB Bill.",
              iconData: FontAwesomeIcons.faucetDrip,
              onPressed: null),
        ],
      ),
    ],
  );
}

Widget customHxButton(
    {required String title,
    required String? subtitle,
    required iconData,
    required VoidCallback? onPressed}) {
  return Column(
    children: [
      const SizedBox(height: 5),
      HxButton(
          title: title,
          subtitle: subtitle,
          icon: iconData,
          // colorful: true,
          // cornerRounded: 25,
          onPressed: onPressed),
      const SizedBox(height: 5),
    ],
  );
}
