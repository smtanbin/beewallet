import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'src/Routes/RouterConfig.dart';

void main() {
  // set the global error handler
  FlutterError.onError = (FlutterErrorDetails details) {
    // handle the error
    if (kDebugMode) {
      print(details);
    }
  };
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Color customLightColor = Color.fromARGB(255, 1, 124, 247);
    Color customLightColor = Color(0xFF73c2fb);
    Color customDarkColor = Color(0xFF00162E);
    // Color customLightColor = Colors.green.shade700;

    return MaterialApp.router(
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
            cardColor: Color(0xFF9bddff),
            backgroundColor: Color(0xFFC5E6FD),
            accentColor: Color(0xFF1560bd),
            brightness: Brightness.light),
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
          cardColor: Color(0xFF003366),
          backgroundColor: Color(0xFF000000),
          accentColor: Color(0xFF73c2fb),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      themeMode: ThemeMode.system,
      // Use system theme mode to automatically switch between light and dark themes
      routerConfig: routerConfig,
    );
  }
}
