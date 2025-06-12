import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AuthController extends StateNotifier<bool> {
  AuthController() : super(false);

  Future<void> login(final String username, final String pin);
}
