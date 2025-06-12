import 'package:flutter/material.dart';

class AuthLoginButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  const AuthLoginButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    Widget widget;

    if (isLoading) {
      widget = const Center(child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
        ),
      ));
    } else {
      widget = Text(label);
    }

    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}
