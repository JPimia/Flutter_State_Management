import 'package:equatable/equatable.dart';

enum NoteStatus { initial, loading, success, error, edited, deleted }

abstract class NotesState extends Equatable {
  const NotesState();
  @override
  List<Object> get props => [];
}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<String> notes;
  final NoteStatus? status;

  const NotesLoaded({
    this.notes = const [],
    this.status = NoteStatus.initial,
  });

  @override
  List<Object> get props => [notes];
}

class NoteDeleted extends NotesState {
  final List<String> notes;
  final NoteStatus? status;

  const NoteDeleted({
    this.notes = const [],
    this.status = NoteStatus.initial,
  });

  @override
  List<Object> get props => [notes];
}
