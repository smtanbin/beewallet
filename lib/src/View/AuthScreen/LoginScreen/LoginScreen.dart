import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../Components/Buttons/HxButton.dart';
import '../../../Components/Inputs/CustomInputBox.dart';
import '../../../Components/Logo.dart';
import '../../../Components/api/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwdController = TextEditingController();
  String _email = '';
  String _passwd = '';
  String _error = ''; // added error variable
  double heightPercent = 0.4; // Change this value to adjust the percentage

  bool loading = true;

  void _onEmailChanged() {
    setState(() {
      _email = emailController.text;
      _passwd = passwdController.text;
    });
  }

  @override
  void initState() {
    loading = true;
    super.initState();
    emailController.addListener(_onEmailChanged);
    _email = emailController.text;

    passwdController.addListener(_onEmailChanged);
    _passwd = passwdController.text;
  }

  @override
  Widget build(BuildContext context) {
    // final auth = useLogin(context);
    final screenHeight = MediaQuery.of(context).size.height;

    final orientation = MediaQuery.of(context).orientation;

    void loginFun() async {
      setState(() {
        loading = false;
      });
      var response = '';

      await authApi(_email, _passwd, (resolve) {
        setState(() {
          loading = true;
        });
        // await storage.write(key: 'USERNAME', value: username.toString());
        context.go("/home");
        response = resolve;
      }, (reject) {
        setState(() {
          loading = true;
          _error = reject; // update error variable when an error occurs
        });
      });
    }

    double textBoxBorderRadius = 50.0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true, // Add this line
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child:
                  // orientation == Orientation.portrait
                  //     ?
                  Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * heightPercent / 4),
                          Logo(
                            height: 100,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: screenHeight * heightPercent / 4),
                          // error text widget

                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              _error,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          CustomInputBox(
                            controller: emailController,
                            label: "Username",
                          ),
                          SizedBox(height: 16.0),
                          CustomInputBox(
                            controller: passwdController,
                            label: "PIN",
                            obscureText: true,
                          ),

                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Expanded(
                                child: HxButtonLoading(
                                  title: 'Login',
                                  cornerRounded: textBoxBorderRadius,
                                  colorful: true,
                                  subtitle: null,
                                  icon: FontAwesomeIcons.rightToBracket,
                                  isLoading: !loading,
                                  onPressed: () {
                                    loginFun();
                                    // context.pushReplacement("/home");
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16.0),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: HxButton(
                          //         textColor:
                          //             Theme.of(context).primaryColorLight,
                          //         title: 'Sign Up',
                          //         cornerRounded: textBoxBorderRadius,
                          //         subtitle: null,
                          //         icon: FontAwesomeIcons.userPlus,
                          //         onPressed: () => context.push("/signUp"),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 16.0),
                          TextButton(
                            onPressed: () => context.push("/loading"),
                            child: const Text('Reset Password'),
                          ),
                        ],
                      ))),
        ),
      ),
    );
  }
}
