import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleDarkMode extends SettingsEvent {}
