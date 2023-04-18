import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class LoginScreen extends StatelessWidget {
  final String sectionKey;
  final void Function(String) onSectionKeyChanged;

  const LoginScreen({
    Key? key,
    required this.sectionKey,
    required this.onSectionKeyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const heightPercent = 0.4; // Change this value to adjust the percentage

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true, // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * heightPercent / 4),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize:
                            54.0, // Change this value to adjust the font size
                        color: Theme.of(context)
                            .colorScheme
                            .primary // Change this value to adjust the text color
                        ),
                  ),
                  SizedBox(height: screenHeight * heightPercent / 4),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onSectionKeyChanged('valid');
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Login'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Reset Password'),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
