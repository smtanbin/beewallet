import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Components/Logo.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    Key? key,
    required this.children,
    this.backgroundImage,
  }) : super(key: key);

  final List<Widget> children;
  final Widget? backgroundImage;

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
              ? Theme.of(context).colorScheme.surface
              : null,
          expandedHeight: screenHeight / 3,
          flexibleSpace: FlexibleSpaceBar(
            title: const Logo(
              color: Colors.blue,
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
