import '/actions/notes_actions.dart';
import '/states/notes_state.dart';

NotesState notesReducer(NotesState state, dynamic action) {
  if (action is AddNoteAction) {
    return NotesState(notes: List.from(state.notes)..add(action.note));
  } else if (action is EditNoteAction) {
    final updatedNotes = List<String>.from(state.notes);
    updatedNotes[action.index] = action.newNote;
    return NotesState(notes: updatedNotes);
  } else if (action is DeleteNoteAction) {
    final updatedNotes = List<String>.from(state.notes);
    updatedNotes.removeAt(action.index);
    return NotesState(notes: updatedNotes);
  }
  return state;
}
