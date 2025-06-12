import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart' hide SettingsTile;

import '../../../vendors/settings_ui/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = const SettingsThemeData(
      settingsListBackground: Colors.transparent,
    );
    return SettingsList(
      platform: detectPlatform(context),
      lightTheme: theme,
      darkTheme: theme,
      contentPadding: const EdgeInsets.all(16),
      sections: [
        SettingsSection(
          title: const Text('Business', style: TextStyle(fontSize: 18)),
          tiles: [
            SettingsTile.navigation(
              title: const Text('Business Profile'),
              description: const Text('Manage your business profile'),
              leading: const Icon(Icons.business),
              onPressed: (final context) {
              },
            ),
            SettingsTile.navigation(
              title: const Text('Payment Methods'),
              description: const Text('Manage your payment methods'),
              leading: const Icon(Icons.payment),
              onPressed: (final context) {
              },
            ),
          ],
        ),
        SettingsSection(
          title: const Text('General', style: TextStyle(fontSize: 18)),
          tiles: [
            SettingsTile.navigation(
              title: const Text('Default Currency'),
              description: const Text('Change the default currency'),
              leading: const Icon(Icons.currency_exchange),
              onPressed: (final context) {
              },
            ),
            SettingsTile.navigation(
              title: const Text('Date Format'),
              description: const Text('Change the date format'),
              leading: const Icon(Icons.date_range),
              onPressed: (final context) {
              },
            ),
            SettingsTile.navigation(
              title: const Text('Number Format'),
              description: const Text('Change the number format'),
              leading: const Icon(Icons.format_list_numbered),
              onPressed: (final context) {
              },
            ),
            SettingsTile.navigation(
              title: const Text('Language'),
              description: const Text('Change the app language'),
              leading: const Icon(Icons.language),
              onPressed: (final context) {
              },
            ),
          ],
        ),
      ],
    );
  }

  static DevicePlatform detectPlatform(final BuildContext context) {
    if (kIsWeb) {
      return DevicePlatform.web;
    }

    final platform = Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.android:
        return DevicePlatform.android;
      case TargetPlatform.fuchsia:
        return DevicePlatform.fuchsia;
      case TargetPlatform.iOS:
        return DevicePlatform.iOS;
      case TargetPlatform.linux:
        return DevicePlatform.linux;
      case TargetPlatform.macOS:
        return DevicePlatform.macOS;
      case TargetPlatform.windows:
        return DevicePlatform.web;
    }
  }
}
