import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(
        seconds: 2)); // replace with your actual data loading code
    // ignore: use_build_context_synchronously
    context.pushReplacement("/home");
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
    return Scaffold(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                semanticsLabel: 'Logo',
                height: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
