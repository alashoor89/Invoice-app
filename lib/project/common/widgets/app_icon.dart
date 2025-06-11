import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/palette.dart';

class AppIcon extends ConsumerWidget {
  final String asset;
  final Color? color;
  final bool defaultColor;
  final double? size;

  const AppIcon({required this.asset, this.color, this.defaultColor = false, this.size, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return SvgPicture.asset(
      asset,
      height: size,
      width: size,
      colorFilter: defaultColor ? null : ColorFilter.mode(color ?? palette.primary, BlendMode.srcIn),
    );
  }
}
