import 'package:bloc_example/settings_bloc/settings_event.dart';
import 'package:bloc_example/settings_bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/settings_bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              title: Text("Dark Mode"),
              trailing: Switch(
                value: state.isDarkMode,
                onChanged: (value) {
                  context.read<SettingsBloc>().add(ToggleDarkMode());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
