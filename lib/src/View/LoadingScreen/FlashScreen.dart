// ignore_for_file: use_build_context_synchronously
import 'package:finWallet/src/Components/api/networkCheck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../Components/Logo.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  bool network = true;

  Future<void> fatchData() async {
    try {
      final response = await networkCheck();
      response
          ? {context.pushReplacement('/login')}
          : setState(() => network = response);
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      setState(() => network = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fatchData();
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.black;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: network
                  ? const Logo()
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(
                            FontAwesomeIcons.linkSlash,
                            size: 50,
                          ),
                          SizedBox(height: 30),
                          Text("Can't connect to server")
                        ]),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("www.haxeri.com"),
            ),
          ),
        ],
      ),
    );
  }
}
