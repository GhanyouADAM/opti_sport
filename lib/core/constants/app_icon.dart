import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.name,
    this.size = 24,
    this.primaryColor,
  });
  final String name;
  final double size;
  final Color? primaryColor;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      width: size,
      height: size,
      colorFilter: primaryColor != null
          ? ColorFilter.mode(primaryColor!, BlendMode.srcIn)
          : null,
    );
  }
}
