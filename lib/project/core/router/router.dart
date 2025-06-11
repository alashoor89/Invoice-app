import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/enums/app_state.dart';
import '../app_provider.dart';
import 'router_refresh_stream.dart';
import 'routes.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(final Ref ref) {
  final route = _AppRoute(ref);
  return route.create();
}

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(final Ref ref) {
  return GlobalKey<NavigatorState>();
}

class _AppRoute {
  final Ref ref;

  _AppRoute(this.ref);

  GoRouter create() {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    return GoRouter(
      initialLocation: Routes.initial.path,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      refreshListenable: RouterRefreshStream(ref),
      routes: Routes.routes.map((final e) => e.route).toList(),
      redirect: (final context, final state) {
        final appState = ref.read(appStateProvider);

        if (appState == AppState.loading) {
          return Routes.splash.path;
        }

        // App is ready

        final currentLocation = state.uri.path;
        final isSplash = currentLocation == Routes.splash.path;
        final isSignedIn = false;

        if (isSplash) {
          final route = isSignedIn ? Routes.home : Routes.login;
          // TODO load the user and determine the next route
          return route.path;
        }

        return null;
      },
    );
  }
}
