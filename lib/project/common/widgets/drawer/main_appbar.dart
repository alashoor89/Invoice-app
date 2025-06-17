import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/palette.dart';
import '../../extensions.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool useDrawer;

  const MainAppBar({this.title, this.actions, this.useDrawer = true, super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    Text? appBarTitle;
    List<Widget>? appBarActions;
    routeBlk:
    if (title == null) {
      final route = Routes.ofContext(context);
      if (route == null) {
        break routeBlk;
      }

      appBarTitle = Text(route.title);
      appBarActions = route.actionBuilder?.call(context);
    } else {
      appBarTitle = Text(title!);
      appBarActions = actions;
    }

    return AppBar(
      title: appBarTitle,
      backgroundColor: palette.primary,
      foregroundColor: palette.white,
      actions: appBarActions,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      automaticallyImplyLeading: false,
      leading: useDrawer.orNull(
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
