import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../constants/constants.dart';
import '../drawer/main_appbar.dart';

class AppDialog extends ConsumerWidget {
  final String title;
  final VoidCallback? onClose;
  final double breakpoint;
  final double width; // only works for non-fullscreen dialogs
  final double height; // only works for non-fullscreen dialogs
  final BorderRadiusGeometry? borderRadius; // only works for non-fullscreen dialogs
  final Widget? child;

  const AppDialog({
    required this.title,
    this.onClose,
    this.breakpoint = AppConstants.secondaryBreakpoint,
    this.width = 600.0, // default width for non-fullscreen dialogs
    this.height = 600.0, // default height for non-fullscreen dialogs
    this.borderRadius,
    this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final breakpoint = MediaQuery.of(context).size.width < this.breakpoint;
    if (breakpoint) {
      return Dialog.fullscreen(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            MainAppBar(
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      ),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 24.0,
            children: [
              Row(
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
              ),
              Expanded(
                child: child ?? const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
