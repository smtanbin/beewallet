import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Components/Buttons/HxButton.dart';
import '../../../../Components/Buttons/MetroButton.dart';
import '../../../../Components/Buttons/customButton.dart';

Widget accountList(context) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 0),
                      gapPadding: 4.0,

                      // borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.account_balance),
                  ),
                  // decoration: const InputDecoration(
                  //   prefixIcon: Icon(Icons.account_balance),
                  // ),
                  hint: const Text('No Account Found'),
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ],
  );
}

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
          onPressed: () {}),
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
// Widget customElevatedButton(
//     context, Function() btnFunction, IconData btnIcon, String btntitel) {
//   final titel = btntitel.toString();
//   const double iconSize = 50.0;
//   const double fontSize = 10.0;

//   final Widget childData = Container(
//     margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//     child: ElevatedButton(
//       onPressed: btnFunction,
//       style: ElevatedButton.styleFrom(
//         // backgroundColor:
//         //     Theme.of(context).colorScheme.primary.withOpacity(0.5),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(btnIcon, size: iconSize),
//               const SizedBox(height: 5),
//               Text(titel, style: const TextStyle(fontSize: fontSize)),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );

//   return MediaQuery.of(context).orientation == Orientation.landscape
//       ? SizedBox(width: MediaQuery.of(context).size.width / 7, child: childData)
//       : SizedBox(
//           width: MediaQuery.of(context).size.width / 3, child: childData);
// }
