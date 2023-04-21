import 'package:flutter/material.dart';
import '../Screen/LoginScreen/LoginScreen.dart';
import '../Screen/SignupScreen/SignupScreen.dart';

class AuthRoutesPage extends StatefulWidget {
  const AuthRoutesPage({Key? key}) : super(key: key);

  @override
  _AuthRoutesPageState createState() => _AuthRoutesPageState();
}

class _AuthRoutesPageState extends State<AuthRoutesPage> {
  late String sectionKey;

  void updateSectionKey(String section) {
    setState(() {
      sectionKey = section;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _screens = [
    LoginScreen(
      sectionKey: '',
      onSectionKeyChanged: (dynamic newKey) {},
    ),
    const SignupScreen(),
  ];

  @override
  void initState() {
    super.initState();
    sectionKey = '';
  }

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
