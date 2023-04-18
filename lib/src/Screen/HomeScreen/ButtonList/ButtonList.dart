import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildButtonList(context);
  }
}

Widget buildButtonList(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  const heightPercent = 0.4;
  return Column(children: [
    SizedBox(height: screenHeight * heightPercent / 8),
    const Text('Home'),
    SizedBox(height: screenHeight * heightPercent / 8),
    accountList(context),
    buttonListSection(context)
  ]);
}

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

Widget buttonListSection(context) {
  return Wrap(
    children: <Widget>[
      customElevatedButton(
        context,
        () {},
        FontAwesomeIcons.vault,
        'Balance',
      ),
      customElevatedButton(
        context,
        () {},
        FontAwesomeIcons.moneyBillTransfer,
        'Send Money',
      ),
      customElevatedButton(
        context,
        () {},
        FontAwesomeIcons.moneyBills,
        'Add Money',
      ),
    ],
  );
}

Widget customElevatedButton(
    context, Function() btnFunction, IconData btnIcon, String btntitel) {
  final titel = btntitel.toString();
  const double fontSize = 50.0;

  return SizedBox(
    width: MediaQuery.of(context).size.width / 3.4, // set width of each button
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ElevatedButton(
        onPressed: btnFunction,
        style: ElevatedButton.styleFrom(
          // backgroundColor:
          //     Theme.of(context).colorScheme.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(btnIcon, size: fontSize),
                const SizedBox(height: 5),
                Text(titel, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
