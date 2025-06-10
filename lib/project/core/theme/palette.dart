import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'light_theme.dart';

part 'palette.g.dart';

final themes = <String, Palette>{
  'light': LightPalette(),
};

@Riverpod(keepAlive: true)
Palette palette(final Ref ref) {
  return themes['light']!;
}

abstract class Palette {
  final Color background;
  final Color foreground;
  final Color backgroundAlt;
  final Color foregroundAlt;
  final Color backgroundAlt2;
  final Color foregroundAlt2;
  final Color primary = const Color(0xFF3498DB);
  final Color success = const Color(0xFF2ECC71);
  final Color warning = const Color(0xFFF39C12);
  final Color danger = const Color(0xFFE74C3C);
  final Color grey = const Color.fromRGBO(209, 213, 219, 1);

  Palette({
    required this.background,
    required this.foreground,
    required this.backgroundAlt,
    required this.foregroundAlt,
    required this.backgroundAlt2,
    required this.foregroundAlt2,
  });

  Brightness get brightness;

  ThemeData get theme => ThemeData(
    brightness: brightness,
    textTheme: GoogleFonts.nunitoTextTheme().apply(bodyColor: foreground, displayColor: foreground),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundAlt,
        foregroundColor: foregroundAlt,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      ),
    ),
  );
}
