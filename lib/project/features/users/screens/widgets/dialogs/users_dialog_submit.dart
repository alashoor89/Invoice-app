import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/constants.dart';
import '../../../../../core/theme/palette.dart';

class UsersDialogSubmit extends ConsumerWidget {
  final GlobalKey<State<ButtonStyleButton>>? buttonKey;
  final VoidCallback onSubmit;
  final String label;

  const UsersDialogSubmit({
    required this.label,
    required this.onSubmit,
    this.buttonKey,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    // Notice here we flipped the math sign, I wanna display spacer if screen is not fullscreen
    final breakpoint = MediaQuery.of(context).size.width > AppConstants.secondaryBreakpoint;
    final palette = ref.watch(paletteProvider);

    return Row(
      spacing: 10,
      children: [
        if (breakpoint) const Spacer(flex: 4),
        Expanded(
          flex: breakpoint ? 2 : 1,
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              key: buttonKey,
              style: ElevatedButton.styleFrom(
                backgroundColor: palette.grey2,
                foregroundColor: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ),
        ),
        Expanded(
          flex: breakpoint ? 3 : 1,
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text(label),
            ),
          ),
        ),
      ],
    );
  }
}
