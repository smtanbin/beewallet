// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../Components/Logo.dart';
import '../../Components/api/networkCheck.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  bool network = true;
  int _countdown = 0;
  Timer? _timer;

  Future<void> fatchData() async {
    try {
      final response = await networkCheck();
      if (mounted) {
        setState(() => network = response);
      }
      if (response) {
        context.pushReplacement('/login');
      } else {
        startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
      if (mounted) {
        setState(() => network = false);
      }
      startTimer();
    }
  }

  void startTimer() {
    // Wait for 30 seconds and retry
    _countdown = 10;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() => _countdown -= 1);
      }
      if (_countdown == 0) {
        timer.cancel();
        fatchData();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fatchData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          const Icon(
                            FontAwesomeIcons.linkSlash,
                            size: 50,
                          ),
                          const SizedBox(height: 30),
                          const Text("Can't connect to server"),
                          Text("Retrying after $_countdown"),
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
