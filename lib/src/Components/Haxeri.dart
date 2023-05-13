import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Haxeri extends StatelessWidget {
  final Color? color;
  final double? height;
  const Haxeri({Key? key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logoColor = color ?? Theme.of(context).primaryColor;
    final logoHeight = height ?? 30;

    return SvgPicture.asset(
      "assets/images/haxeri.svg",
      colorFilter: ColorFilter.mode(logoColor, BlendMode.srcIn),
      semanticsLabel: 'Logo',
      height: logoHeight,
    );
  }
}
