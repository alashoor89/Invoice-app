import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ContentConstraint extends StatelessWidget {
  final Widget child;
  final BoxConstraints constraints;

  const ContentConstraint({
    this.constraints = const BoxConstraints(),
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: AppConstants.desktopContentMaxWidth,
      ).enforce(constraints),
      child: child,
    );
  }
}
