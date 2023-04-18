import 'package:flutter/material.dart';
import 'package:dashboard/src/Home/BodyComponents.dart';
import 'Screen/LoginScreen.dart';

class Auth {
  late final String sectionKey;

  Auth(this.sectionKey);

  Widget getScreen() {
    if (isValidSectionKey()) {
      return const Expanded(child: Body());
    } else {
      return LoginScreen(
        sectionKey: sectionKey,
        onSectionKeyChanged: (newKey) {
          sectionKey = newKey;
        },
      );
    }
  }

  bool isValidSectionKey() {
    // Perform validation logic here
    // Return true if sectionKey is valid, false otherwise
     sectionKey == "valid";
     return true;
  }
}
