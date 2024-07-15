import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final Color? color;
  final String iconPath;
  final double size;
  const CustomIcon({
    super.key,
    this.color,
    required this.iconPath,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height: 25,
      width: 22,
    );
  }
}
