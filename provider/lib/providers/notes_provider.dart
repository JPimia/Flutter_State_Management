import 'package:flutter/material.dart';
import '/models/notes_model.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(String content) {
    _notes.add(Note(content: content));
    notifyListeners();
  }

  void editNote(int index, String newContent) {
    _notes[index].content = newContent;
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
