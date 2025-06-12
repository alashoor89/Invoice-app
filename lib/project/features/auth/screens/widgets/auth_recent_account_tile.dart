import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/auth_controller.dart';

class AuthRecentAccountTile extends ConsumerWidget {
  const AuthRecentAccountTile({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final name = 'James Smith';
    final lastUsed = '2 days ago';
    return ListTile(
      tileColor: const Color(0xFFEFEFEF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(8.0)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('Last used: $lastUsed'),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        ref.read(loginStateProvider.notifier).state = true;
      },
    );
  }
}
