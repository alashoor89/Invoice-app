import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/controllers.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (final ref) => _AuthController(ref),
);

// Temporary

final loginStateProvider = StateProvider<bool>((final ref) {
  return false;
});

class _AuthController extends AuthController {
  final Ref _ref;

  _AuthController(this._ref);

  @override
  Future<void> login(final String username, final String pin) {
    state = true;
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        _ref.read(loginStateProvider.notifier).state = true;
      },
    ).whenComplete(
      () => state = false,
    );
  }
}
