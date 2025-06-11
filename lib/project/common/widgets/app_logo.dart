import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  final double width;
  final double height;

  const AppLogo({
    this.width = 128,
    this.height = 128,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Assets.images.logoTransparent.image(
      width: width,
      height: height,
    );
  }
}
