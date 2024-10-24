import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleDarkMode extends SettingsEvent {}
