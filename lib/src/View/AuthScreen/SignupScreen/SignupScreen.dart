import 'package:flutter/material.dart';

import '../../../Routes/GoAppBar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool otpPress = false; //
  void enableotp() {
    setState(() {
      otpPress = true;
    });
  }

  void numberVerification(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmailScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const heightPercent = 0.4; // Change this value to adjust the percentage

    final contactNumberController = TextEditingController(); // Add this line
    final otpController = TextEditingController(); // Add this line

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: GoAppBar(
        title: const Text("Sign Up"),
      ),
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 54.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: screenHeight * heightPercent / 4),
                  TextFormField(
                    controller: contactNumberController, // Add this line
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  otpPress
                      // ignore: dead_code
                      ? TextFormField(
                          controller: otpController, // Add this line
                          decoration: InputDecoration(
                            labelText: 'OTP',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 30.0),
                  otpPress
                      ? Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  numberVerification(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Submit'),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  enableotp();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Verify Number'),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your email'),
      ),
      body: const Center(
        child: Text('Email screen'),
      ),
    );
  }
}
