import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/users_controller.dart';
import 'tiles/user_tile.dart';

class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final users = ref.watch(usersProvider);
    return ListView.builder(
      itemBuilder: (final context, final index) {
        return UserTile(user: users[index], key: ValueKey(users[index]));
      },
      itemCount: users.length,
      itemExtent: 80.0,
    );
  }
}
