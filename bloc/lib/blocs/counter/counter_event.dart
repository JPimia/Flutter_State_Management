import 'package:equatable/equatable.dart';

// abstract class CounterEvent extends Equatable {
//   const CounterEvent();

//   @override
//   List<Object> get props => [];
// }

// class IncrementEvent extends CounterEvent {}

// class DecrementEvent extends CounterEvent {}

// class CounterStarted extends CounterEvent {}

// Events
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
