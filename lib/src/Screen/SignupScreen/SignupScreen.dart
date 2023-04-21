import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  void _checkContactNumber(
    BuildContext context,
    String contactNumber,
    String otp, // Add this line
  ) {
    // Perform some validation on the contact number and OTP here
    // For example, check if they're valid phone numbers and OTPs
    bool isValidContactNumber = true;
    bool isValidOTP = true;

    if (isValidContactNumber && isValidOTP) {
      // Navigate to the new page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailScreen()),
      );
    } else {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid contact number or OTP')),
      );
    }
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
                  TextFormField(
                    controller: otpController, // Add this line
                    decoration: InputDecoration(
                      labelText: 'OTP',
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
                            _checkContactNumber(
                              context,
                              contactNumberController.text,
                              otpController.text, // Add this line
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Check'),
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
