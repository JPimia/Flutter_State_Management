import '/models/notes_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier() : super([]);

  List<Note> get notes => state;

  void addNote(String content) {
    state = [...state, Note(content: content)];
  }

  void editNote(int index, String newContent) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) Note(content: newContent) else state[i]
    ];
  }

  void deleteNote(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}
