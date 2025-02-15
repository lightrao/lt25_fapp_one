import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../utils/settings_keys.dart';

class SettingsScreenPage extends StatelessWidget {
  const SettingsScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: 'Settings',
      children: <Widget>[
        SwitchSettingsTile(
          settingKey: SettingsKeys.darkMode,
          title: 'Dark Mode',
          defaultValue: false,
          onChange: (bool value) {
            // Here you can trigger theme change or perform any logic
            debugPrint('Dark Mode changed: $value');
          },
        ),
        // You can add more settings tiles here, for example a checkbox:
        CheckboxSettingsTile(
          settingKey: 'enable_notifications',
          title: 'Enable Notifications',
          defaultValue: true,
          onChange: (bool value) {
            debugPrint('Notifications enabled: $value');
          },
        ),
      ],
    );
  }
}
