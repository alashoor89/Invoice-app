import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BooleanExt on bool {
  // / Returns the provided value if the boolean is true, otherwise returns null.
  E? orNull<E>(final E? value) {
    return this ? value! : null;
  }

  /// Returns the provided value if the boolean is false, otherwise returns null.
  E? inverseOrNull<E>(final E? value) {
    return this ? null : value;
  }
}

extension DynamicExt on dynamic {
  /// Returns the provided value if the object is not null, otherwise returns null.
  E? orNull<E>(final Function() func) {
    return this != null ? func() : null;
  }
}

extension BuildContextExt on BuildContext {
  T read<T>(final ProviderListenable<T> provider) => ProviderScope.containerOf(this, listen: false).read<T>(provider);

  void showErrorSnackBar({required final String message, final Function()? onRetry}) {
    final state = ScaffoldMessenger.maybeOf(this);
    if (state == null) {
      return;
    }

    state.showSnackBar(
      SnackBar(
        content: Text(message),
        action: onRetry.orNull(
          () => SnackBarAction(
            label: 'Retry',
            onPressed: onRetry!,
          ),
        ),
        duration: const Duration(seconds: 5),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
