import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/extensions.dart';
import '../../common/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/users/controllers/users_controller.dart';
import '../../features/users/screens/users_screen.dart';
import '../theme/palette.dart';
import 'models/router_model.dart';

class Routes {
  const Routes._();

  // routes that are independent of the main app and don't need a shell
  static final List<RouteModel> routes = [
    splash,
    login,
  ];

  // TODO maintain the order of the sidebar items.
  static final List<RouteModel> branches = [
    home,
    settings,
    users,
  ];

  static final RouteModel initial = splash;

  static RouteModel? ofState(final GoRouterState state) {
    bool func(final route) => route.path == state.uri.path || route.name == state.name;
    RouteModel? model = routes.firstWhereOrNull(func);
    model ??= branches.firstWhereOrNull(func);
    return model;
  }

  static RouteModel? ofContext(final BuildContext context) {
    return ofState(GoRouterState.of(context));
  }

  static final splash = RouteModel.build(
    name: 'SplashScreen',
    path: '/splash',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: SplashScreen()),
  );

  static final login = RouteModel.build(
    name: 'LoginScreen',
    path: '/login',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: LoginScreen()),
  );

  static final home = RouteModel.build(
    name: 'HomeScreen',
    title: 'Home',
    path: '/',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: HomeScreen()),
  );

  static final users = RouteModel.build(
    name: 'UsersScreen',
    title: 'Users',
    path: '/users',
    actionBuilder: (final context) {
      final palette = context.read(paletteProvider);
      return [
        IconButton(
          icon: const Icon(Icons.add),
          color: palette.white,
          tooltip: 'Create User',
          style: IconButton.styleFrom(
            backgroundColor: palette.white.withValues(alpha: 0.1),
            shape: const CircleBorder(),
          ),
          onPressed: context.read(usersControllerProvider).openCreateUserDialog,
        ),
      ];
    },
    pageBuilder: (final context, final state) => const NoTransitionPage(child: UsersScreen()),
  );

  static final settings = RouteModel.build(
    name: 'SettingsScreen',
    title: 'Settings',
    path: '/settings',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: SettingsScreen()),
  );
}

class SubRoutes {
  const SubRoutes._();
}
