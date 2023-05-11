import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../View/AuthScreen/SignupScreen/SignupScreen.dart';
import '../View/AuthScreen/LoginScreen/LoginScreen.dart';

import '../View/Body/BodyScreen.dart';
import '../View/Body/TransferScreen/TransferWidget.dart';
import '../View/LoadingScreen.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: "/logIn",
  routes: <RouteBase>[
    GoRoute(
        name: "logIn",
        path: "/logIn",
        builder: (context, state) => const LoginScreen()),
    // GoRoute(
    //     name: "loading",
    //     path: "/loading",
    //     builder: (context, state) =>
    //         LoadingScreen(username: state.extra! as String)),
    GoRoute(
        name: "loading",
        path: "/loading",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoadingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
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
      name: "transferMoney",
      path: "/transferMoney",
      builder: (context, state) => const TransferWidget(),
    ),
  ],
);
