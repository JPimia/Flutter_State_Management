import 'package:bloc/bloc.dart';
import 'package:bloc_example/blocs/counter/counter_event.dart';
import 'package:bloc_example/blocs/counter/counter_state.dart';
import 'package:equatable/equatable.dart';

// NotesBloc
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  List<String> _notes = [];

  NotesBloc() : super(NotesLoading()) {
    on<AddNote>((event, emit) {
      _notes.add(event.note);
      emit(NotesLoaded(status: NoteStatus.success, notes: _notes));
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
        final updatedNotes = List<String>.from((state as NotesLoaded).notes);
        updatedNotes.removeAt(event.index);
        _notes = updatedNotes;
        emit(NotesLoaded(notes: updatedNotes));
      }
    });
  }
}
