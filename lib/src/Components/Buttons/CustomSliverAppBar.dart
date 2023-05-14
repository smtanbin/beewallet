import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppBar extends StatelessWidget {
  var backgroundColor;

  CustomSliverAppBar({
    Key? key,
    required this.children,
    this.backgroundImage,
    this.title,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final List<Widget> children;
  final Widget? backgroundImage;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          backgroundColor: backgroundImage == null
              ? backgroundColor ?? Theme.of(context).colorScheme.surface
              : null,
          expandedHeight: screenHeight / 3,
          flexibleSpace: FlexibleSpaceBar(
            title: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            background: backgroundImage ?? Container(),
            centerTitle: true,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 25,
            ),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight / 5,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(children),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
      ]),
    );
  }
}
