import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/repositories.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(final Ref ref) {
  return _AuthRepository(ref);
}

class _AuthRepository extends AuthRepository {
  _AuthRepository(super.ref);
}
