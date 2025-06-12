import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../interfaces/controllers.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
SettingsController settingsController(final Ref ref) {
  return _SettingsController(ref);
}

class _SettingsController extends SettingsController {
  final Ref _ref;

  _SettingsController(this._ref);
}
