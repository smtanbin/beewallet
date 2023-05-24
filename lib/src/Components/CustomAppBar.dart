import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Logo.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: false,
      title: Row(
        children: [
          Logo(
            color: Theme.of(context).colorScheme.primary,
            height: 30,
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
          color: Theme.of(context).colorScheme.primary,
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
