import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interfaces/controllers.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
AuthController authController(Ref ref) {
  return _AuthController(ref);
}

class _AuthController extends AuthController {
  final Ref _ref;

  _AuthController(this._ref);
}
