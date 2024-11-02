import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, index) {
        return Column(
          children: [
            ListTile(
              title: Text("Dark Mode"),
              trailing: Switch(
                value: settingsProvider.isDarkMode,
                onChanged: (value) {
                  settingsProvider.toggleDarkMode();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
