import 'package:bloc/bloc.dart';
import 'package:bloc_example/blocs/counter/counter_event.dart';
import 'package:bloc_example/blocs/counter/counter_state.dart';
import 'package:equatable/equatable.dart';

// NotesBloc
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final List<String> _notes = ["Header 1", "Header 2", "Header 3"];

  NotesBloc() : super(NotesLoading()) {
    on<AddNote>((event, emit) {
      _notes.add(event.note);
      emit(NotesLoaded(_notes));
    });

    on<EditNote>((event, emit) {
      _notes[event.index] = event.newNote;
      emit(NotesLoaded(_notes));
    });

    on<DeleteNote>((event, emit) {
      _notes.removeAt(event.index);
      emit(NotesLoaded(_notes));
    });
  }
}
