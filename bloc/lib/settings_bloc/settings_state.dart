import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isDarkMode;

  const SettingsState(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
