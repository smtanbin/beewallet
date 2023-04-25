import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = colorful
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.background;

    double luminance = backgroundColor.computeLuminance();
    // print("luminance: ${luminance}");
    // Color textColor = Theme.of(context).colorScheme.inversePrimary;

    Color textColor = luminance > 0.3
        ? Theme.of(context).colorScheme.inversePrimary
        : Theme.of(context).colorScheme.inversePrimary;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: isLarge
            ? const EdgeInsets.symmetric(vertical: 50, horizontal: 20)
            : const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRounded)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(width: isLarge ? 8 : 2),
              Visibility(
                visible: subtitle != null,
                child: Text(
                  subtitle ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                icon,
                size: isLarge ? 50 : 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
