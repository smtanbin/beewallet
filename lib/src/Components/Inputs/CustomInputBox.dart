import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color fillColor;
  var onchange;

  bool obscureText;

  CustomInputBox({
    Key? key,
    required this.label,
    required this.controller,
    this.onchange,
    this.obscureText = false,
    this.fillColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          labelText: label,
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
          ),
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onChanged: onchange,
      ),
    );
  }
}
