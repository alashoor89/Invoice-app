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
    home,
    login,
  ];

  static final RouteModel initial = splash;

  static final splash = RouteModel.build(
    name: 'SplashScreen',
    path: '/splash',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: SplashScreen()),
  );

  static final home = RouteModel.build(
    name: 'HomeScreen',
    path: '/',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: HomeScreen()),
  );

  static final login = RouteModel.build(
    name: 'LoginScreen',
    path: '/auth/login',
    pageBuilder: (final context, final state) => const NoTransitionPage(child: LoginScreen()),
  );
}

class SubRoutes {
  const SubRoutes._();
}
