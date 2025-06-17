import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../constants/fonts.dart';

class AppOutlinedTextField extends HookConsumerWidget {
  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final IconData? icon;
  final bool readonly;
  final bool obscure;
  final bool textArea;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const AppOutlinedTextField({
    required this.label,
    required this.controller,
    this.placeholder,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.icon,
    this.textInputAction,
    this.readonly = false,
    this.obscure = false,
    this.textArea = false,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final obscureText = useState(obscure);
    final border = OutlineInputBorder(borderSide: BorderSide(color: palette.grey));
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readonly,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      maxLines: textArea ? 6 : 1,
      minLines: textArea ? 3 : 1,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: palette.danger)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle().bold.copyWith(color: palette.black),
        labelStyle: const TextStyle().bold.copyWith(color: palette.black),
        hintStyle: const TextStyle().small.copyWith(color: palette.black.withValues(alpha: 0.5)),
        suffixIcon: icon != null ? Icon(icon, color: palette.black.withValues(alpha: 0.5)) : null,
      ),
      obscureText: obscureText.value,
      style: const TextStyle().small.copyWith(color: palette.black),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: onSubmitted,
    );
  }
}
