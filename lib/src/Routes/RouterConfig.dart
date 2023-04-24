import 'package:go_router/go_router.dart';

import '../View/Body/BodyScreen.dart';
import '../View/AuthScreen/SignupScreen/SignupScreen.dart';
import '../View/AuthScreen/LoginScreen/LoginScreen.dart';
import '../View/LoadingScreen.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: "/logIn",
  routes: <RouteBase>[
    GoRoute(
        name: "loading",
        path: "/loading",
        builder: (context, state) => LoadingScreen()),
    GoRoute(
        name: "login",
        path: "/logIn",
        builder: (context, state) => const LoginScreen()),
    GoRoute(
      name: "signUp",
      path: "/signUp",
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const BodyScreen(),
    ),
  ],
);
