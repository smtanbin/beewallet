import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import '../ColorShade.dart';

class HxButton extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  final double cornerRounded;
  final bool isLarge;
  final bool colorful;
  Color? textColor;

  HxButton({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onPressed,
    this.cornerRounded = 5,
    this.isLarge = false,
    this.colorful = false,
    this.textColor,
  }) : super(key: key);

  ColorShade _colorShade = ColorShade();
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _colorShade.getBackgroundColor(context);

    // double luminance = backgroundColor.computeLuminance();
    // print("luminance: ${luminance}");
    Color textColor = Theme.of(context).colorScheme.inverseSurface;

    // Color textColor = luminance > 0.3 ? Colors.black26 : Colors.black26;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            (colorful ? Theme.of(context).primaryColor : backgroundColor),
        padding: isLarge
            ? const EdgeInsets.symmetric(vertical: 50, horizontal: 20)
            : const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRounded)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // Add Expanded widget here
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Update this property
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor,
                  ),
                ),
                SizedBox(width: isLarge ? 8 : 2),
                Visibility(
                  visible: subtitle != null,
                  child: Text(
                    subtitle ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                icon,
                size: isLarge ? 50 : 25,
                color: textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
