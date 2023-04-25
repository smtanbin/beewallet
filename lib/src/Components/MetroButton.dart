import 'package:flutter/material.dart';

class MetroButton extends StatelessWidget {
  const MetroButton({
    required this.onPressed,
    required this.icon,
    this.label = 'Default Button',
    this.notificationCount = 0,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData? icon;
  final String label;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = theme.colorScheme.primary;
    final textColor = theme.colorScheme.inversePrimary;
    final buttonSize = MediaQuery.of(context).size.width / 3;

    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              child: Column(
                // mainAxisSize: MainAxisSize.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 30, color: textColor),
                    const SizedBox(width: 10),
                  ],
                  Text(
                    label,
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
                ],
              ),
            ),
            if (notificationCount > 0)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 5,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
