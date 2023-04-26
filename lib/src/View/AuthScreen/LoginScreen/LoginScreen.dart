import 'package:bee_wallet/src/View/AuthScreen/LoginScreen/useLogin.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../Components/ColorShade.dart';
import '../../../Components/Buttons/HxButton.dart';
import '../../../Components/Logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  String _email = '';
  double heightPercent = 0.4; // Change this value to adjust the percentage
  ColorShade _colorShade = ColorShade();
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
    final Color backgroundColor = _colorShade.getBackgroundColor(context);
    final orientation = MediaQuery.of(context).orientation;
    final passwdController = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true, // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: orientation == Orientation.portrait
                ? Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * heightPercent / 4),
                        const Logo(
                          height: 100,
                        ),
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
                                  await auth.login(emailController.text,
                                      passwdController.text);
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
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () => context.push("/loading"),
                          child: const Text('Reset Password'),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: 'dash',
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(screenHeight / 8),
                                        child: Logo(
                                          height: (screenHeight / 5),
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                      ElevatedButton.icon(
                                        label: const Text('Sign Up'),
                                        icon: const Icon(
                                            FontAwesomeIcons.userPlus),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          minimumSize: Size(0, 60),
                                        ),
                                        onPressed: () =>
                                            context.push("/signUp"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(100.0),
                                    child: Column(
                                      children: [
                                        Hero(
                                            tag: 'dash',
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  screenHeight / 8),
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontSize: screenHeight / 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            labelText: 'Username',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
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
                                                icon: FontAwesomeIcons
                                                    .rightToBracket,
                                                onPressed: () async {
                                                  await auth.login(
                                                      emailController.text,
                                                      passwdController.text);
                                                  // context.pushReplacement("/home");
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16.0),
                                        const SizedBox(height: 16.0),
                                        TextButton(
                                          onPressed: () =>
                                              context.push("/loading"),
                                          child: const Text('Reset Password'),
                                        ),
                                      ],
                                    ),
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
      ),
    );
  }
}
