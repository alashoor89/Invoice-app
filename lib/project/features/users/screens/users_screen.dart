import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/users_header.dart';
import 'widgets/users_list.dart';
import 'widgets/users_table.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final breakpoint = size.width > 700;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16.0,
        children: [
          if (breakpoint) const UsersHeader(),
          if (breakpoint)
            const UsersTable()
          else
            const UsersList(),
        ],
      ),
    );
  }
}
