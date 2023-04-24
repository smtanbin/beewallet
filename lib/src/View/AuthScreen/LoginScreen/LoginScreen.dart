import 'package:bee_wallet/src/View/AuthScreen/LoginScreen/useLogin.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = useLogin(context);
    final screenHeight = MediaQuery.of(context).size.height;
    const heightPercent = 0.4; // Change this value to adjust the percentage
    final emailController = TextEditingController();
    final passwdController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true, // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwdController,
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
                          onPressed: () async {
                            await auth.login(
                                emailController.text, passwdController.text);
                            // context.pushReplacement("/home");
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => context.push("/signUp"),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Sign Up'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
