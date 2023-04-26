import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  final Color? color;
  final double? height;
  const Logo({Key? key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoColor = color ?? Theme.of(context).primaryColor;
    final logoHeight = height ?? 70;

    return SvgPicture.asset(
      "assets/images/logo.svg",
      colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
      semanticsLabel: 'Logo',
      height: logoHeight,
    );
  }
}
