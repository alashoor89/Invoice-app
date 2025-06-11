import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_logo.dart';
import '../../../common/widgets/text_divider.dart';
import 'widgets/auth_login_form.dart';
import 'widgets/auth_recently_used_accounts.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              spacing: 8.0,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppLogo(width: 192, height: 192),
                AuthRecentlyUsedAccounts(),
                SizedBox(height: 2.0),
                TextDivider(text: 'OR'),
                SizedBox(height: 2.0),
                AuthLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
