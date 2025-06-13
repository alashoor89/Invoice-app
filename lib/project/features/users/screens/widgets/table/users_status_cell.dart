import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../vendors/syncfusion_flutter_datagrid/enhanced_grid_cell.dart';
import '../../../models/user_model.dart';

class UsersStatusCell extends ConsumerWidget {
  final UserModel user;

  const UsersStatusCell({
    required this.user,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return EnhancedGridCell.text(
      label: user.isActive ? 'Active' : 'Inactive',
      color: user.isActive ? palette.success : palette.danger,
      icon: Container(
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          color: user.isActive ? palette.success : palette.danger,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
