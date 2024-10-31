import '/states/settings_state.dart';
import '/actions/settings_actions.dart';

SettingsState settingsReducer(state, dynamic action) {
  if (state is ToggleDarkModeAction) {
    return SettingsState(isDarkMode: !state.isDarkMode);
  }
  return state;
}
