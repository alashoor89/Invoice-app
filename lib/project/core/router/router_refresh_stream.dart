import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(final Ref ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);

    // TODO later handle user redirections

    // Future.delayed(const Duration(seconds: 1), () {
    //   navigatorKey.currentContext?.pushReplacementNamed(Routes.home.name);
    // });
  }
}
