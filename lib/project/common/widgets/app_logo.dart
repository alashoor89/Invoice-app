import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  final double width;
  final double height;
  final Function()? onTap;

  const AppLogo({
    this.width = 128,
    this.height = 128,
    this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Assets.images.logoTransparent.image(
        width: width,
        height: height,
      ),
    );
  }
}
