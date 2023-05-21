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
    // Color myColor = Color.fromARGB(255, 1, 124, 247);
    Color myColor = Color(0xff009e60);

    final customColor = MaterialColor(
      myColor.value,
      <int, Color>{
        50: myColor.withOpacity(0.1),
        100: myColor.withOpacity(0.2),
        200: myColor.withOpacity(0.3),
        300: myColor.withOpacity(0.4),
        400: myColor.withOpacity(0.5),
        500: myColor.withOpacity(0.6),
        600: myColor.withOpacity(0.7),
        700: myColor.withOpacity(0.8),
        800: myColor.withOpacity(0.9),
        900: myColor.withOpacity(1.0),
      },
    );

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customColor,
          accentColor: myColor,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: customColor,
          // backgroundColor: Colors.blue.shade900,
          cardColor: Colors.black,
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
