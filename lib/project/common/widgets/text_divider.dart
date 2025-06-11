import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({required this.text, super.key});

  @override
  Widget build(final BuildContext context) {
    final dividerColor = Theme.of(context).dividerColor;
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor.withValues(alpha: 0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        Expanded(
          child: Divider(
            color: dividerColor.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
