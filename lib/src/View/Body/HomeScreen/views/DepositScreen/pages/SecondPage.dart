import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'DepositHero.dart';

class SecondPage extends StatelessWidget {
  int? acno;
  String? name;
  double? balance;
  SecondPage({
    super.key,
    required this.acno,
    required this.name,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    print('SecondPage =>>>>>>>>>> $name');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Text("Reciver Titel: ${payload.name.toString()}"),
                              Text("----"),
                            ],
                          ),
                          Row(
                            children: [
                              // Text("Reciver Number: ${payload.acno.toString()}"),
                              Text("----"),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text("----"),
                              // Text("My Balance: ${payload.balance.toString()}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: 'Account',
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
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}


// class Account {
//   final int mphone;
//   final String accountName;
//   final double balance;

//   Account({
//     required this.mphone,
//     required this.accountName,
//     required this.balance,
//   });

//   factory Account.fromJson(Map<String, dynamic> json) {
//     return Account(
//       mphone: json['MPHONE'] as int,
//       accountName: json['ACCOUNT_NAME'] as String,
//       balance: json['BALANCE'] as double,
//     );
//   }
// }