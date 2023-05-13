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
    final Color backgroundColor = Theme.of(context).colorScheme.background;

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: false,
      // title: Logo(
      //   color: Theme.of(context).colorScheme.inverseSurface,
      //   height: 40,
      // ),
      title: Row(
        children: [
          Logo(
            color: Theme.of(context).colorScheme.inverseSurface,
            height: 30,
          ),
          Text(
            "Bee Wallet",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface,
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
