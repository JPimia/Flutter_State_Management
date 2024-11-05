import 'package:bloc_example/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(settingsProvider);

    return Column(
      children: [
        ListTile(
          title: const Text("Dark Mode"),
          trailing: Switch(
            value: isDarkMode,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).toggleDarkMode();
            },
          ),
        ),
      ],
    );
  }
}
