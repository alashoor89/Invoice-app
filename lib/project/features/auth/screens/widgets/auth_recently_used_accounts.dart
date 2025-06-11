import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/palette.dart';
import 'auth_recent_account_tile.dart';

class AuthRecentlyUsedAccounts extends ConsumerWidget {
  const AuthRecentlyUsedAccounts({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: palette.grey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Text('Recent Accounts', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          AuthRecentAccountTile(),
          AuthRecentAccountTile(),
        ],
      ),
    );
  }
}
