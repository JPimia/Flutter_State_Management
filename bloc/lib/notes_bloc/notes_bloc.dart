import 'package:bloc/bloc.dart';

import '/notes_bloc/notes_event.dart';
import '/notes_bloc/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  List<String> _notes = [];

  NotesBloc() : super(NotesLoading()) {
    on<AddNote>(_onAddNote);
    on<EditNote>(_onEditNote);
    on<DeleteNote>(_onDeleteNote);
  }

  Future<void> _onAddNote(AddNote event, Emitter<NotesState> emit) async {
    final updatedNotes = List<String>.from(_notes);
    updatedNotes.add(event.note);
    _notes = updatedNotes;
    emit(NotesLoaded(notes: updatedNotes));
  }

  Future<void> _onEditNote(EditNote event, Emitter<NotesState> emit) async {
    if (state is NotesLoaded) {
      final updatedNotes = List<String>.from((state as NotesLoaded).notes);
      updatedNotes[event.index] = event.newNote;
      _notes = updatedNotes;
      emit(NotesLoaded(notes: updatedNotes));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NotesState> emit) async {
    if (state is NotesLoaded) {
      final updatedNotes = List<String>.from(_notes);
      updatedNotes.removeAt(event.index);
      _notes = updatedNotes;
      emit(NotesLoaded(notes: updatedNotes));
    }
  }
}
