import 'package:bloc_example/actions/settings_actions.dart';
import 'package:bloc_example/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../states/app_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsState>(
      converter: (store) => store.state.settingsState!,
      builder: (context, settingsState) {
        return Column(
          children: [
            ListTile(
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: settingsState.isDarkMode,
                onChanged: (value) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(ToggleDarkModeAction());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
