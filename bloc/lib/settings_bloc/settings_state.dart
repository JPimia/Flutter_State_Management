import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
class SettingsState extends Equatable {
  final bool isDarkMode;

  const SettingsState(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
