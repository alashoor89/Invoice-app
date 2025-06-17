import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/widgets/interactive_ink_well.dart';
import '../../../../../core/theme/palette.dart';
import '../../../../../vendors/syncfusion_flutter_datagrid/enhanced_grid_cell.dart';
import '../../../controllers/users_controller.dart';
import '../../../models/user_model.dart';

class UserTile extends ConsumerWidget {
  final UserModel user;

  const UserTile({
    required this.user,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final statusColor = user.isActive ? palette.success : palette.danger;
    return InteractiveInkWell(
      onTap: () {},
      onLongPress: () {
        ref.read(usersControllerProvider).openEditUserDialog(context, user);
      },
      backgroundColor: palette.backgroundAlt,
      radius: 8.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsetsDirectional.only(start: 8.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                user.role.label,
              ),
            ],
          ),
          const Spacer(),
          EnhancedGridCell.bubbleText(
            label: user.isActive ? 'Active' : 'Inactive',
            innerPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            backgroundColor: statusColor.withValues(alpha: 0.5),
            foregroundColor: palette.black,
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
