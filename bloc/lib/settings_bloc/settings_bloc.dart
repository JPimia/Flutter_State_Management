import 'package:bloc/bloc.dart';
import 'package:bloc_example/settings_bloc/settings_event.dart';
import 'package:bloc_example/settings_bloc/settings_state.dart';
import 'package:equatable/equatable.dart';

// Bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(false)) {
    on<ToggleDarkMode>((event, emit) {
      emit(SettingsState(!state.isDarkMode));
    });
  }
}
