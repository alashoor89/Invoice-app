import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/extensions.dart';
import '../../../../common/widgets/app_outlined_text_field.dart';
import '../../controllers/auth_controller.dart';
import 'auth_login_button.dart';

class AuthLoginForm extends HookWidget {
  const AuthLoginForm({super.key});

  @override
  Widget build(final BuildContext context) {
    final usernameEC = useTextEditingController();
    final pinEc = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final buttonKey = useMemoized(() => GlobalKey<State<ButtonStyleButton>>());
    // TODO add auto-hint for username and pin fields
    return Form(
      key: formKey,
      child: Column(
        spacing: 4.0,
        children: [
          AppOutlinedTextField(
            label: 'Username',
            placeholder: 'Enter your username',
            controller: usernameEC,
            validator: ['min:3', 'max:20', 'required'].validate(
              customMessages: {
                'min': 'Username must be at least 3 characters long.',
                'max': 'Username must not exceed 20 characters.',
                'required': 'Username is required.',
              },
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 8.0),
          AppOutlinedTextField(
            label: 'PIN',
            placeholder: 'Enter your PIN',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6), // Assuming a 6-digit PIN
            ],
            controller: pinEc,
            obscure: true,
            validator: ['min:6', 'max:6', 'required'].validate(
              customMessages: {
                'min': 'PIN must be exactly 6 digits long.',
                'max': 'PIN must be exactly 6 digits long.',
                'required': 'PIN is required.',
              },
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => buttonKey.currentState?.widget.onPressed?.call(),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: Consumer(
              builder: (final context, final ref, final child) {
                return AuthLoginButton(
                  buttonKey: buttonKey,
                  label: 'Sign In',
                  isLoading: ref.watch(authControllerProvider),
                  onPressed: () {
                    final isValid = formKey.currentState?.validate() ?? false;
                    if (!isValid) {
                      return;
                    }

                    ref.read(authControllerProvider.notifier).login(usernameEC.value.text.trim(), pinEc.value.text.trim()).catchError((final error) {
                      if (!context.mounted) {
                        return;
                      }
                      context.showErrorSnackBar(
                        message: 'Login failed. Check your credentials and try again.',
                        onRetry: () {
                          buttonKey.currentState?.widget.onPressed?.call();
                        },
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
