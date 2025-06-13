import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../common/widgets/app_icon.dart';
import '../../../../../core/theme/palette.dart';
import '../../../controllers/users_controller.dart';
import '../../../models/user_model.dart';

class UsersActionCell extends ConsumerWidget {
  final UserModel user;

  const UsersActionCell({
    required this.user,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8.0,
        children: [
          AppIcon(
            asset: Assets.icons.edit,
            size: 16.0,
            color: palette.black,
            onTap: () {
              // Handle edit action
            },
          ),
          AppIcon(
            asset: Assets.icons.delete,
            size: 16.0,
            color: palette.black,
            onTap: () {
              // Handle delete action
              ref.read(usersProvider.notifier).update((final state) => state.where((final element) => element != user,).toList());
            },
          ),
        ],
      ),
    );
  }
}
