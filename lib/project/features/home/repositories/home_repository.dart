import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../interfaces/repositories.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(final Ref ref) {
  return _HomeRepository(ref);
}

class _HomeRepository extends HomeRepository {
  _HomeRepository(super.ref);
}
