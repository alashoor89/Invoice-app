import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../interfaces/repositories.dart';

part 'settings_repository.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(final Ref ref) {
  return _SettingsRepository(ref);
}

class _SettingsRepository extends SettingsRepository {
  _SettingsRepository(super.ref);
}
