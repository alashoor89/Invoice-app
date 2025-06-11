import 'package:go_router/go_router.dart';

class RouteModel {
  final String name;
  final String path;
  final GoRouterPageBuilder? pageBuilder;
  final GoRouterWidgetBuilder? builder;
  final GoRouterRedirect? redirect;
  final List<RouteModel>? routes;
  final List<RouteModel>? routes0;

  const RouteModel._({
    required this.name,
    required this.path,
    this.pageBuilder,
    this.redirect,
    this.builder,
    this.routes = const [],
    this.routes0 = const [],
  });

  factory RouteModel.build({
    required final String name,
    required final String path,
    final GoRouterPageBuilder? pageBuilder,
    final GoRouterWidgetBuilder? builder,
    final GoRouterRedirect? redirect,
    final List<RouteModel> routes,
  }) = RouteModel._;

  GoRoute get route => GoRoute(
        name: name,
        path: path,
        pageBuilder: pageBuilder,
        redirect: redirect,
        builder: builder,
        routes: routes?.map((final e) => e.route).toList() ?? [],
      );

  StatefulShellBranch get shell => StatefulShellBranch(
        initialLocation: path,
        routes: [route, ...(routes0?.map((final e) => e.route).toList() ?? [])],
      );
}
