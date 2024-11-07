import 'package:bloc/bloc.dart';

import '/notes_bloc/notes_event.dart';
import '/notes_bloc/notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  List<String> _notes = [];

  NotesBloc() : super(NotesLoading()) {
    on<AddNote>((event, emit) {
      final updatedNotes = List<String>.from(_notes);
      updatedNotes.add(event.note);
      _notes = updatedNotes;
      emit(NotesLoaded(notes: updatedNotes));
    });

    on<EditNote>((event, emit) {
      if (state is NotesLoaded) {
        final updatedNotes = List<String>.from((state as NotesLoaded).notes);
        updatedNotes[event.index] = event.newNote;
        _notes = updatedNotes;
        emit(NotesLoaded(notes: updatedNotes));
      }
    });

    on<DeleteNote>((event, emit) {
      if (state is NotesLoaded) {
        final updatedNotes = List<String>.from(_notes);
        updatedNotes.removeAt(event.index);
        _notes = updatedNotes;
        emit(NotesLoaded(notes: updatedNotes));
      }
    });
  }
}
