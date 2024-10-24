import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Notes States
abstract class NotesState extends Equatable {
  @override
  List<Object> get props => [];
}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<String> notes;
  NotesLoaded(this.notes);

  @override
  List<Object> get props => [notes];
}
