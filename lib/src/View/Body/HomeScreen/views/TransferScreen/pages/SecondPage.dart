import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'DepositHero.dart';

class SecondPage extends StatelessWidget {
  var name;
  SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DepositHero(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                              Text("Reciver Number: ${name.toString()}"),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Text("My Balance: ${name.toString()}"),
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
