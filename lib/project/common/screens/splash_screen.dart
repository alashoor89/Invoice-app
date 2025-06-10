import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';

final random = Random.secure();

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Assets.images.logoTransparent.image(
          width: 256,
          height: 256,
        ),
      ),
    );
  }
}
