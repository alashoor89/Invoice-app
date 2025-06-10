import 'package:go_router/go_router.dart';

import '../../common/screens/splash_screen.dart';
import '../../features/home/screens/home_screen.dart';
import 'models/router_model.dart';

class Routes {
  const Routes._();

  // routes that are independent of the main app and don't need a shell
  static final List<RouteModel> routes = [splash, home];

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
}

class SubRoutes {
  const SubRoutes._();
}
