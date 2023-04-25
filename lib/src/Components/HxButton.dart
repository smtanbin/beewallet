import 'package:flutter/material.dart';

class IconButtonWithTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  Color textColor;

  IconButtonWithTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    textColor = Theme.of(context).primaryColor;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
              SizedBox(width: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(icon, color: textColor),
            ],
          ),
        ],
      ),
    );
  }
}
