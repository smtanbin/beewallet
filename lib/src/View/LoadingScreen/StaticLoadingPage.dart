import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Components/ColorShade.dart';
import '../../Components/Logo.dart';

class StaticLoadingScreen extends StatelessWidget {
  StaticLoadingScreen({super.key});

  final ColorShade _colorShade = ColorShade();

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
