import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/palette.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final route = Routes.ofContext(context)!;
    return AppBar(
      title: Text(route.title),
      backgroundColor: palette.primary,
      foregroundColor: palette.white,
      actions: route.actionBuilder?.call(context),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
