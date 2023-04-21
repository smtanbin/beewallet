import 'package:HexWallet/src/Auth.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.green);

  late ColorScheme _defaultDarkColorScheme;

  final sectionKey = "true";

  @override
  void initState() {
    super.initState();
    // Initialize the default dark color scheme based on the current platform brightness
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    _defaultDarkColorScheme = ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        brightness: brightness,
        backgroundColor: Colors.black);
    // Listen for changes in the platform brightness and update the default dark color scheme accordingly
    WidgetsBinding.instance!.window.onPlatformBrightnessChanged =
        _updateDefaultDarkColorScheme;
  }

  @override
  void dispose() {
    // Stop listening for changes in the platform brightness
    WidgetsBinding.instance!.window.onPlatformBrightnessChanged = null;
    super.dispose();
  }

  void _updateDefaultDarkColorScheme() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;
    setState(() {
      _defaultDarkColorScheme = ColorScheme.fromSwatch(
          primarySwatch: Colors.green, brightness: brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightColorScheme, ColorScheme? darkColorScheme) {
        return MaterialApp(
          title: 'HaxWallet',
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode
              .system, // Use system theme mode to automatically switch between light and dark themes
          home: Auth(sectionKey).getScreen(),
        );
      },
    );
  }
}
