import 'package:flutter/material.dart';

import 'palette.dart';

class LightPalette extends Palette {
  LightPalette()
    : super(
        // first scheme
        background: const Color(0xFFF8F9FA),
        foreground: const Color(0xFF000000),
        // second scheme
        backgroundAlt: const Color(0xFFFFFFFF),
        foregroundAlt: const Color(0xFF111827),
        // third scheme
        backgroundAlt2: const Color(0xFFECECEC),
        foregroundAlt2: const Color(0xFF959595),
      );

  @override
  Brightness get brightness => Brightness.light;

  @override
  ThemeData get theme => super.theme.copyWith(scaffoldBackgroundColor: background);
}
