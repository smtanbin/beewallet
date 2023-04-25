import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    final Color backgroundColor = (isDark
        ? Theme.of(context).primaryColor.withOpacity(0.9)
        : Theme.of(context).primaryColor.withOpacity(0.3));

    final Color logoColor = (isDark
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColor);

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Center(
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
          semanticsLabel: 'Logo',
          height: 30,
        ),
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
              const PopupMenuItem(
                child: Text('Test'),
              ),
            ];
          },
        )
      ],
    );
  }
}
