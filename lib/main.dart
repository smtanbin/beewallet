import 'package:beewallet/src/Components/Haxeri.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/Routes/RouterConfig.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (kDebugMode) {
      print(details);
    }
  };
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainApp> {
  late SharedPreferences _prefs;
  String? themeTrigger;
  Color customLightColor = const Color(0xFF005026);
  Color customDarkColor = const Color(0xFF005026);
  late Future<void> _initPreferencesFuture;

  @override
  void initState() {
    super.initState();
    _initPreferencesFuture = _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      themeTrigger = _prefs.getString('themeTrigger');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initPreferencesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: MaterialColor(
                  customLightColor.value,
                  <int, Color>{
                    50: customLightColor.withOpacity(0.1),
                    100: customLightColor.withOpacity(0.2),
                    200: customLightColor.withOpacity(0.3),
                    300: customLightColor.withOpacity(0.4),
                    400: customLightColor.withOpacity(0.5),
                    500: customLightColor.withOpacity(0.6),
                    600: customLightColor.withOpacity(0.7),
                    700: customLightColor.withOpacity(0.8),
                    800: customLightColor.withOpacity(0.9),
                    900: customLightColor.withOpacity(1.0),
                  },
                ),
                // cardColor: const Color(0xFF9BDDFF),
                backgroundColor: const Color.fromARGB(255, 238, 250, 240),
                // accentColor: Color.fromARGB(255, 23, 170, 106),

                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: MaterialColor(
                  customDarkColor.value,
                  <int, Color>{
                    50: customDarkColor.withOpacity(0.1),
                    100: customDarkColor.withOpacity(0.2),
                    200: customDarkColor.withOpacity(0.3),
                    300: customDarkColor.withOpacity(0.4),
                    400: customDarkColor.withOpacity(0.5),
                    500: customDarkColor.withOpacity(0.6),
                    600: customDarkColor.withOpacity(0.7),
                    700: customDarkColor.withOpacity(0.8),
                    800: customDarkColor.withOpacity(0.9),
                    900: customDarkColor.withOpacity(1.0),
                  },
                ),
                // cardColor: const Color(0xFF003366),
                backgroundColor: const Color(0xFF000000),
                accentColor: const Color.fromARGB(255, 51, 77, 61),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            themeMode: _getThemeMode(),
            routerConfig: routerConfig,
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
          ); // Show a loading indicator while initializing preferences
        }
      },
    );
  }

  Future<void> _setThemeTrigger(String? value) async {
    setState(() {
      themeTrigger = value;
    });
    await _prefs.setString('themeTrigger', value ?? '');
  }

  ThemeMode _getThemeMode() {
    switch (themeTrigger) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      case "system":
      default:
        return ThemeMode.system;
    }
  }
}
