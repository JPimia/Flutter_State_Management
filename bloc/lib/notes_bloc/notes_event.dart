import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Notes Events
abstract class NotesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddNote extends NotesEvent {
  final String note;
  AddNote(this.note);
}

class EditNote extends NotesEvent {
  final int index;
  final String newNote;
  EditNote(this.index, this.newNote);
}

class DeleteNote extends NotesEvent {
  final int index;
  DeleteNote(this.index);
}
