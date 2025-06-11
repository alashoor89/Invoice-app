import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/enums/app_state.dart';
import '../../common/screens/main_screen.dart';
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

@Riverpod(keepAlive: true)
GlobalKey<StatefulNavigationShellState> shellKey(final Ref ref) {
  return GlobalKey<StatefulNavigationShellState>();
}

class _AppRoute {
  final Ref ref;

  _AppRoute(this.ref);

  GoRouter create() {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    final shellKey = ref.watch(shellKeyProvider);

    return GoRouter(
      initialLocation: Routes.initial.path,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      refreshListenable: RouterRefreshStream(ref),
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: navigatorKey,
          branches: Routes.branches.map((final e) => e.shell).toList(),
          key: shellKey,
          builder: (final context, final state, final navigationShell) {
            return MainScreen(navigationShell: navigationShell);
          },
        ),
        ...Routes.routes.map((final e) => e.route),
      ],
      redirect: (final context, final state) {
        final appState = ref.read(appStateProvider);

        if (appState == AppState.loading) {
          return Routes.splash.path;
        }

        // App is ready

        final currentLocation = state.uri.path;
        final isSplash = currentLocation == Routes.splash.path;
        final isSignedIn = true;

        if (isSplash) {
          final route = isSignedIn ? Routes.home : Routes.login;
          // TODO load the user and determine the next route
          return route.path;
        }

        if (isSignedIn && currentLocation == Routes.login.path) {
          return Routes.home.path;
        }

        if (!isSignedIn && currentLocation != Routes.login.path) {
          return Routes.login.path;
        }

        return null;
      },
    );
  }
}
