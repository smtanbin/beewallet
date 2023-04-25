import 'package:bee_wallet/src/View/AuthScreen/LoginScreen/useLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../Components/HxButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  String _email = '';
  double heightPercent = 0.4; // Change this value to adjust the percentage

  void _onEmailChanged() {
    setState(() {
      _email = emailController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_onEmailChanged);
    _email = emailController.text;
  }

  @override
  Widget build(BuildContext context) {
    final auth = useLogin(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    final Color tempBackgroundColor = (isDark
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).scaffoldBackgroundColor);

    final Widget logo = SvgPicture.asset(
      "assets/images/logo.svg",
      colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary, BlendMode.srcIn),
      semanticsLabel: 'Logo',
      height: 100,
    );

    final passwdController = TextEditingController();

    return Scaffold(
      backgroundColor: tempBackgroundColor,
      resizeToAvoidBottomInset: true, // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * heightPercent / 4),
                  logo,
                  SizedBox(height: screenHeight * heightPercent / 4),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
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
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: HxButton(
                          title: 'Login',
                          cornerRounded: 50,
                          colorful: true,
                          subtitle: null,
                          icon: FontAwesomeIcons.rightToBracket,
                          onPressed: () async {
                            await auth.login(
                                emailController.text, passwdController.text);
                            // context.pushReplacement("/home");
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: HxButton(
                          textColor: Theme.of(context).primaryColorLight,
                          title: 'Sign Up',
                          cornerRounded: 50,
                          subtitle: null,
                          icon: FontAwesomeIcons.userPlus,
                          onPressed: () => context.push("/signUp"),
                        ),
                      ),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () => context.push("/loading"),
                      //     child: const Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text('emg login'),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () => context.push("/loading"),
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
