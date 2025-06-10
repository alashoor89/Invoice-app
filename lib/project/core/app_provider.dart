import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/enums/app_state.dart';

part 'app_provider.g.dart';

@riverpod
App app(final Ref ref) {
  return _AppImpl(ref);
}

final appStateProvider = StateProvider<AppState>((final ref) {
  return AppState.loading;
});

abstract class App {
  Future<void> init();
}

class _AppImpl extends App {
  final Ref ref;

  _AppImpl(this.ref);

  @override
  Future<void> init() async {
    final stateNotifier = ref.read(appStateProvider.notifier);

    stateNotifier.state = AppState.loading;

    // Simulate some initialization work

    await Future.delayed(const Duration(seconds: 2));

    // After initialization, set the state to ready

    stateNotifier.state = AppState.ready;
  }
}
