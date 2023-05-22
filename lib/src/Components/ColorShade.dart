import 'package:flutter/material.dart';

class ColorShade {
  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color getBackgroundColor(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    // final bool isDark = brightnessValue == Brightness.dark;
    return Theme.of(context).colorScheme.background; //update
    // return isDark
    //     ? darken(Theme.of(context).scaffoldBackgroundColor, 0.8)
    //     : Theme.of(context).scaffoldBackgroundColor;
  }
}
