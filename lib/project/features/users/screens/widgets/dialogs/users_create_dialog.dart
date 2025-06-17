import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/widgets/form/app_outlined_dropdown.dart';
import '../../../../../common/widgets/form/app_outlined_text_field.dart';
import '../../../../../common/widgets/form/app_switch.dart';
import '../../../enums/user_role.dart';
import 'users_create_dialog_submit.dart';

class UsersCreateDialog extends HookConsumerWidget {
  const UsersCreateDialog({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final usernameEC = useTextEditingController();
    final fullNameEC = useTextEditingController();
    final pinEC = useTextEditingController();
    final role = useRef<UserRole?>(null); // why ref? We don't want to rebuild the widget when the role changes
    final activeSwitch = useRef(false); // See top ^^

    return Form(
      key: formKey,
      child: Column(
        spacing: 12.0,
        children: [
          AppOutlinedTextField(
            label: 'FullName',
            placeholder: 'Enter your full name',
            controller: fullNameEC,
            onChanged: (final value) {},
            validator: ['min:3', 'max:50', 'required'].validate(
              customMessages: {
                'min': 'Full name must be at least 3 characters long.',
                'max': 'Full name must not exceed 50 characters.',
                'required': 'Full name is required.',
              },
            ),
            textInputAction: TextInputAction.next,
          ),
          AppOutlinedTextField(
            label: 'Username',
            placeholder: 'Enter your username',
            controller: usernameEC,
            onChanged: (final value) {},
            validator: ['min:3', 'max:20', 'required'].validate(
              customMessages: {
                'min': 'Username must be at least 3 characters long.',
                'max': 'Username must not exceed 20 characters.',
                'required': 'Username is required.',
              },
            ),
            textInputAction: TextInputAction.next,
          ),
          AppOutlinedTextField(
            label: 'PIN',
            placeholder: 'Enter your PIN',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6), // Assuming a 6-digit PIN
            ],
            controller: pinEC,
            obscure: true,
            validator: ['min:6', 'max:6', 'required'].validate(
              customMessages: {
                'min': 'PIN must be exactly 6 digits long.',
                'max': 'PIN must be exactly 6 digits long.',
                'required': 'PIN is required.',
              },
            ),
            textInputAction: TextInputAction.next,
          ),
          AppOutlinedDropdown<UserRole>(
            label: 'Role',
            placeholder: 'Select a role',
            items: UserRole.values,
            titleBuilder: (final item) => item.label,
            onChanged: (final value) => role.value = value,
          ),
          AppSwitch(
            label: 'Account Status',
            activeLabel: 'Active',
            inactiveLabel: 'Inactive',
            initialValue: false,
            onChanged: (final value) => activeSwitch.value = value,
          ),
          const Divider(),
          UsersCreateDialogSubmit(
            label: 'Create',
            onSubmit: () {
              final validate = formKey.currentState?.validate() ?? false;
              if (!validate) {
                return;
              }
              // Handle the submit action here
              print('Full Name: ${fullNameEC.text}');
              print('Username: ${usernameEC.text}');
              print('Role: ${role.value}');
              print('PIN: ${pinEC.text}');
              print('Active: ${activeSwitch.value}');
            },
          ),
        ],
      ),
    );
  }
}
