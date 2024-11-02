// app_reducer.dart
import '/states/app_state.dart';
import 'notes_reducer.dart';
import 'news_reducer.dart';
import 'settings_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    notesState: notesReducer(state.notesState, action),
    newsState: newsReducer(state.newsState, action),
    settingsState: settingsReducer(state.settingsState, action),
  );
}
