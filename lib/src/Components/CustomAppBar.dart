import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('BeeWallet'),
      actions: [
        PopupMenuButton<Text>(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Test'
                    // localization.demoNavigationRailFirst,
                    ),
              ),
              const PopupMenuItem(
                child: Text('Test'
                    // localization.demoNavigationRailSecond,
                    ),
              ),
              const PopupMenuItem(
                child: Text('Test'
                    // localization.demoNavigationRailThird,
                    ),
              ),
            ];
          },
        )
      ],
    );
  }
}
