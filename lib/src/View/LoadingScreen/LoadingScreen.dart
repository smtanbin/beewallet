// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Components/ColorShade.dart';
import '../../Components/Logo.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  final ColorShade _colorShade = ColorShade();

  Future<void> loadData() async {
    //   const select = "ACCOUNT_NAME ,mphone ,CON_MOB ,CUST_ID,BALANCE_M ";
    //   const from = "reginfo";
    //   final where = "mphone = ${widget.username}";

    //   try {
    //     var response = await api(context, 'POST', '/query',
    //         {"select": select, "from": from, "where": where}, (error) {
    //       context.go("/login");
    //     });

    //     if (response != null) {
    //       context.go("/home", extra: response);
    //     } else {
    //       context.go("/login");
    //     }
    //   } catch (e) {
    //     print("Error in loading $e");
    //   }
    context.go("/home");
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _colorShade.getBackgroundColor(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoadingAnimationWidget.discreteCircle(
                size: 100,
                secondRingColor: Theme.of(context).colorScheme.primaryContainer,
                thirdRingColor: Theme.of(context).colorScheme.tertiary,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Logo(),
            ),
          ),
        ],
      ),
    );
  }
}
