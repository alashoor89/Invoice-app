import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/fonts.dart';
import '../../../../common/widgets/interactive_ink_well.dart';
import '../../../../core/theme/palette.dart';
import '../../../models/sidebar_item_model.dart';
import '../../app_icon.dart';

class MainSidebarItem extends ConsumerWidget {
  final SidebarItemModel item;

  const MainSidebarItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final state = GoRouterState.of(context);
    final path = state.uri.path;
    final selected = path == item.route;
    final highlightColor = selected ? palette.primary : Colors.transparent;
    final textColor = selected ? palette.background : palette.foregroundAlt;

    return InteractiveInkWell(
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      backgroundColor: highlightColor,
      onTap: () {
        context.go(item.route);
      },
      child: SizedBox(
        width: 200,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppIcon(
              asset: item.icon,
              color: textColor,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              item.title,
              style: const TextStyle().normal.bold.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
