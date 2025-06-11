import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import 'main_sidebar_items.dart';
import 'main_sidebar_logo.dart';

class MainSidebar extends ConsumerWidget {
  const MainSidebar({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return Container(
      decoration: BoxDecoration(
        color: palette.white.withValues(alpha: 0.5),
        border: Border(
          right: BorderSide(color: palette.grey, width: 1),
        ),
      ),
      child: const Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  MainSidebarLogo(),
                  SizedBox(height: 12),
                  Expanded(child: MainSidebarItems()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
