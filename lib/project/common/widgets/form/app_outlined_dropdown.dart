import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';
import '../../constants/fonts.dart';

class AppOutlinedDropdown<T> extends ConsumerWidget {
  final String label;
  final String placeholder;
  final T? initialValue;
  final List<T> items;
  final bool readonly;
  final String Function(T item) titleBuilder;
  final FormFieldValidator<T?>? validator;
  final Function(T? value)? onChanged;

  const AppOutlinedDropdown({
    required this.label,
    required this.placeholder,
    required this.items,
    required this.titleBuilder,
    this.initialValue,
    this.validator,
    this.readonly = false,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final border = OutlineInputBorder(borderSide: BorderSide(color: palette.grey));
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: palette.danger),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle().bold.copyWith(color: palette.black),
          hintStyle: const TextStyle().small.copyWith(color: palette.black.withValues(alpha: 0.5)),
        ),
        items: [
          DropdownMenuItem<T>(
            value: null,
            enabled: false,
            child: Text(placeholder),
          ),
          ...items.map(
            (final item) => DropdownMenuItem<T>(
              value: item,
              child: Text(titleBuilder(item)),
            ),
          ),
        ],
        value: initialValue,
        borderRadius: BorderRadius.circular(8),
        style: const TextStyle().small.copyWith(color: palette.black),
        dropdownColor: palette.white,
        onChanged: readonly ? null : onChanged,
        validator:
            validator ??
            (final value) {
              if (value == null) {
                return 'Please select an option';
              }
              return null;
            },
      ),
    );
  }
}
