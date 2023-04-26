import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Components/ColorShade.dart';
import '../Components/Logo.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  final ColorShade _colorShade = ColorShade();

  Future<void> loadData() async {
    await Future.delayed(const Duration(
        seconds: 1)); // replace with your actual data loading code
    // ignore: use_build_context_synchronously
    context.go("/home");
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Center(
  //           child: Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: LoadingAnimationWidget.discreteCircle(
  //               size: 100,
  //               secondRingColor: Theme.of(context).colorScheme.primaryContainer,
  //               thirdRingColor: Theme.of(context).colorScheme.tertiary,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //         ),
  //         SvgPicture.asset(
  //           "assets/images/logo.svg",
  //           colorFilter: ColorFilter.mode(
  //               Theme.of(context).primaryColor, BlendMode.srcIn),
  //           semanticsLabel: 'Logo',
  //           height: 70,
  //         ),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _colorShade.getBackgroundColor(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoadingAnimationWidget.discreteCircle(
                size: 100,
                secondRingColor: Theme.of(context).colorScheme.primaryContainer,
                thirdRingColor: Theme.of(context).colorScheme.tertiary,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Logo(),
            ),
          ),
        ],
      ),
    );
  }
}
