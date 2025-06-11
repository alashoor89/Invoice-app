import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

final random = Random.secure();

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context) {
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
