import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SharedPreferences _prefs;
  late ThemeMode _selectedThemeMode;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedThemeMode = _getSavedThemeMode();
    });
  }

  ThemeMode _getSavedThemeMode() {
    final themeModeValue = _prefs.getInt('themeMode') ?? ThemeMode.system.index;
    return ThemeMode.values[themeModeValue];
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    setState(() {
      _selectedThemeMode = themeMode;
    });
    await _prefs.setInt('themeMode', themeMode.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Theme Mode:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButton<ThemeMode>(
                value: _selectedThemeMode,
                onChanged: (ThemeMode? newValue) {
                  if (newValue != null) {
                    _saveThemeMode(newValue);
                  }
                },
                items: const [
                  DropdownMenuItem<ThemeMode>(
                    value: ThemeMode.system,
                    child: Text('System'),
                  ),
                  DropdownMenuItem<ThemeMode>(
                    value: ThemeMode.light,
                    child: Text('Light'),
                  ),
                  DropdownMenuItem<ThemeMode>(
                    value: ThemeMode.dark,
                    child: Text('Dark'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
