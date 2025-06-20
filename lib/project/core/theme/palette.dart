import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/constants/fonts.dart';
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
  final Color grey2 = const Color(0xFFEFEFEF);
  final Color lightGrey = const Color(0xFFF9FAFB);
  final Color black = const Color(0xFF000000);
  final Color white = const Color(0xFFFFFFFF);

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
    textTheme: GoogleFonts.interTextTheme().apply(bodyColor: foreground, displayColor: foreground),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: backgroundAlt,
      linearTrackColor: backgroundAlt,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(primary),
        foregroundColor: WidgetStatePropertyAll(backgroundAlt),
        textStyle: WidgetStatePropertyAll(const TextStyle().bold),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 32)),
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(white),
    ),
  );
}
