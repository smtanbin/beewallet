import 'package:flutter/material.dart';

import '../Home/BodyComponents.dart';
import '../Screen/SettingsScreen.dart';

void homeRoutes() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const Body(),
      '/setting': (context) => const SettingsScreen()
    }));
