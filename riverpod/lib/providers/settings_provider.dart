import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider =
    StateNotifierProvider<SettingsProvider, bool>((ref) => SettingsProvider());

class SettingsProvider extends StateNotifier<bool> {
  SettingsProvider() : super(false);

  bool get isDarkMode => state;

  void toggleDarkMode() {
    state = !state;
  }
}
