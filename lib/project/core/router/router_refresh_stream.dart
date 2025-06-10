import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router.dart';
import 'routes.dart';

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(final Ref ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);

    // TODO later handle user redirections

    // Future.delayed(const Duration(seconds: 1), () {
    //   navigatorKey.currentContext?.pushReplacementNamed(Routes.home.name);
    // });
  }
}
