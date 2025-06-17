import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';

class AppSwitch extends HookConsumerWidget {
  final String label;
  final String activeLabel;
  final String inactiveLabel;
  final bool initialValue;
  final bool readonly;
  final Function(bool)? onChanged;

  const AppSwitch({
    required this.label,
    required this.activeLabel,
    required this.inactiveLabel,
    this.readonly = false,
    this.initialValue = false,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final switchState = useState(initialValue);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500).copyWith(color: palette.black),
        ),
        Switch(
          value: switchState.value,
          onChanged: readonly
              ? null
              : (final value) {
                  switchState.value = value;
                  onChanged?.call(value);
                },
          activeTrackColor: palette.primary,
          inactiveTrackColor: palette.grey,
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ],
    );
  }
}
