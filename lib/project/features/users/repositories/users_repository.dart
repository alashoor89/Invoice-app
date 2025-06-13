import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/repositories.dart';

part 'users_repository.g.dart';

@Riverpod(keepAlive: true)
UsersRepository usersRepository(final Ref ref) {
  return _UsersRepository(ref);
}

class _UsersRepository extends UsersRepository {
  _UsersRepository(super.ref);
}
