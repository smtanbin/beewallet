import 'package:flutter/material.dart';
import '../Screen/LoginScreen/LoginScreen.dart';
import '../Screen/SignupScreen/SignupScreen.dart';

class AuthRoutesPage extends StatefulWidget {
  final String sectionKey;
  final Null Function(dynamic newKey) onSectionKeyChanged;

  AuthRoutesPage(
      {Key? key, required this.sectionKey, required this.onSectionKeyChanged})
      : super(key: key);

  @override
  _AuthRoutesPageState createState() => _AuthRoutesPageState();
}

class _AuthRoutesPageState extends State<AuthRoutesPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    LoginScreen(
      sectionKey: '',
      onSectionKeyChanged: (dynamic newKey) {},
    ),
    const SignupScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Sign Up',
          ),
        ],
      ),
    );
  }
}
