import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Components/Buttons/CustomSliverAppBar.dart';

class AmountPage extends StatelessWidget {
  var response;
  AmountPage({
    super.key,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> listOfItems = response[0].values.toList();
    String accountNumber = listOfItems[0] as String;
    String name = listOfItems[1] as String;
    String balance = listOfItems[2] as String;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, //update,
      body: CustomSliverAppBar(
        title: "Deposit",
        icon: FontAwesomeIcons.coins,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Reciver Titel: ${name.toString()}"),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    "Reciver Account No: ${accountNumber.toString()}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text("My Balance: ${balance.toString()}"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'Amount',
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 70),
                        ),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        label: const Text("Back")),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send_rounded),
                      label: const Text('Send'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(50, 70),
                        foregroundColor: Theme.of(context)
                            .colorScheme
                            .inversePrimary, // set the color of the label text and icon
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
