// app_state.dart
import 'notes_state.dart';
import 'news_state.dart';
import 'settings_state.dart';

class AppState {
  final NotesState notesState;
  final NewsState newsState;
  final SettingsState settingsState;

  AppState({
    this.notesState = const NotesState(),
    this.newsState = const NewsState(),
    required bool isDarkMode,
    required SettingsState settingsState,
  }) : settingsState = SettingsState(isDarkMode: isDarkMode);
}
