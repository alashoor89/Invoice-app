import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/app_logo.dart';

final random = Random.secure();

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: AppLogo(
          width: 256,
          height: 256,
        ),
      ),
    );
  }
}
