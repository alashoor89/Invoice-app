import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../constants/constants.dart';
import '../drawer/main_appbar.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onClose;
  final double breakpoint;
  final double width; // only works for non-fullscreen dialogs
  final double height; // only works for non-fullscreen dialogs
  final BorderRadiusGeometry borderRadius; // only works for non-fullscreen dialogs
  final Widget? child;

  const AppDialog({
    required this.title,
    this.onClose,
    this.breakpoint = AppConstants.secondaryBreakpoint,
    this.width = 600.0, // default width for non-fullscreen dialogs
    this.height = 600.0, // default height for non-fullscreen dialogs
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final breakpoint = MediaQuery.of(context).size.width < this.breakpoint;
    final borderRadius = breakpoint ? BorderRadius.zero : this.borderRadius;
    final insetPadding = breakpoint ? EdgeInsets.zero : null;
    final outerPadding = breakpoint ? EdgeInsets.zero : const EdgeInsets.all(24);
    final innerPadding = breakpoint ? const EdgeInsets.all(20) : EdgeInsets.zero;
    Widget appbar;
    if (breakpoint) {
      appbar = MainAppBar(
        title: title,
        useDrawer: false,
        actions: [
          Consumer(
            builder: (final context, final ref, _) {
              final palette = ref.watch(paletteProvider);
              return IconButton(
                icon: const Icon(Icons.close, size: 24),
                style: IconButton.styleFrom(
                  backgroundColor: palette.white.withValues(alpha: 0.1),
                  shape: const CircleBorder(),
                ),
                onPressed: onClose ?? () => Navigator.of(context).pop(),
              );
            },
          ),
        ],
      );
    } else {
      appbar = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 24, color: Colors.grey),
            onPressed: onClose ?? () => Navigator.of(context).pop(),
          ),
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      insetPadding: insetPadding,
      backgroundColor: Colors.white,
      child: SizedBox(
        width: breakpoint ? double.infinity : width,
        height: breakpoint ? double.infinity : height,
        child: Padding(
          padding: outerPadding,
          child: Column(
            spacing: 24.0,
            children: [
              appbar,
              Expanded(
                child: Padding(
                  padding: innerPadding,
                  child: child ?? const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
