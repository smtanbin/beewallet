import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../View/AuthScreen/SignupScreen/SignupScreen.dart';
import '../View/AuthScreen/LoginScreen/LoginScreen.dart';

import '../View/Body/BodyScreen.dart';
import '../View/Body/HomeScreen/views/DepositScreen/AccountSearchScreen.dart';
import '../View/Body/HomeScreen/views/DepositScreen/pages/SecondPage.dart';
import '../View/LoadingScreen/FlashScreen.dart';
import '../View/LoadingScreen/LoadingScreen.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: "/init",
  routes: <RouteBase>[
    GoRoute(
        name: "init",
        path: "/init",
        builder: (context, state) => const FlashScreen()),
    GoRoute(
        name: "logIn",
        path: "/logIn",
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        name: "loading",
        path: "/loading",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoadingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
          // builder: (context, state) => LoginScreen(),
        }),
    GoRoute(
      name: "signUp",
      path: "/signUp",
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => BodyScreen(),
    ),
    GoRoute(
        name: "accountSearch",
        path: "/accountSearch",
        builder: (context, state) => const AccountSearchScreen(),
        routes: [
          GoRoute(
            name: "informationPage",
            path: "informationPage/:acno/:name/:balance",
            builder: (context, state) {
              final acno = int.parse(state.pathParameters['acno']!);
              final name = state.pathParameters['name']!;
              final balance = double.parse(state.pathParameters['balance']!);
              return SecondPage(
                acno: acno,
                name: name,
                balance: balance,
              );
            },
          ),
        ]),
  ],
);
