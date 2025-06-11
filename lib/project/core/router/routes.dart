import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import 'models/router_model.dart';

class Routes {
  const Routes._();

  // routes that are independent of the main app and don't need a shell
  static final List<RouteModel> routes = [
    splash,
    login,
  ];

  static final List<RouteModel> branches = [
    home,
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

  static final home = RouteModel.build(
    name: 'HomeScreen',
    title: 'Home',
    path: '/',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: HomeScreen()),
  );

  static final login = RouteModel.build(
    name: 'LoginScreen',
    path: '/login',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: LoginScreen()),
  );
}

class SubRoutes {
  const SubRoutes._();
}
