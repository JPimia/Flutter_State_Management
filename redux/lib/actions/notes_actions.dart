// notes_actions.dart
class AddNoteAction {
  final String note;
  AddNoteAction(this.note);
}

class EditNoteAction {
  final int index;
  final String newNote;
  EditNoteAction(this.index, this.newNote);
}

class DeleteNoteAction {
  final int index;
  DeleteNoteAction(this.index);
}
