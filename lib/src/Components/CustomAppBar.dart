import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'ColorShade.dart';
import 'Logo.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final ColorShade _colorShade = ColorShade();
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    // final bool isDark = brightnessValue == Brightness.dark;
    final Color backgroundColor = Theme.of(context).colorScheme.background;
    // _colorShade.lighten(Theme.of(context).colorScheme.primaryContainer, .3);
    // final Color backgroundColor = (isDark
    //     ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9)
    //     : Theme.of(context).appBarTheme.backgroundColor.withOpacity(0.3));

    // final Color logoColor = (isDark ? Colors.black : Colors.white60);

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 200),
            child: Logo(
              color: Theme.of(context).colorScheme.primary,
              height: 30,
            ),
          ),
          Text(
            "Bee Wallet",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      actions: [
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Test'),
              ),
              const PopupMenuItem(
                child: Text('Test'),
              ),
              PopupMenuItem(
                child: const Text('Sign out '),
                onTap: () {
                  context.go('/login');
                },
              )
            ];
          },
        )
      ],
    );
  }
}
