import '/states/settings_state.dart';
import '/actions/settings_actions.dart';

SettingsState settingsReducer(SettingsState state, dynamic action) {
  if (action is ToggleDarkModeAction) {
    return SettingsState(isDarkMode: !state.isDarkMode);
  }
  return state;
}
