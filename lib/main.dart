import 'package:dashboard/src/Home/BodyComponents.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      // theme: ThemeData.from(useMaterial3: true,colorScheme: colorScheme),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green.shade900,
      ),
      home: const Expanded(child: Body()),
    );
  }
}
