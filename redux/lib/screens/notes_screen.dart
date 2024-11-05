import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/notes_actions.dart';
import '../states/app_state.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Dispatch action to add new news item
              StoreProvider.of<AppState>(context).dispatch(
                AddNoteAction("New Note"),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StoreConnector<AppState, List<String>>(
              converter: (store) => store.state.notesState.notes,
              builder: (context, notes) {
                if (notes.isEmpty) {
                  // Show a message if there are no notes
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No notes available. Please add a note."),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                } else {
                  // Display the list of notes
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notes[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit button
                            ElevatedButton(
                              onPressed: () {
                                StoreProvider.of<AppState>(context).dispatch(
                                  EditNoteAction(index, 'Edited Note'),
                                );
                              },
                              child: const Text("Edit"),
                            ),
                            const SizedBox(width: 8),
                            // Delete button
                            ElevatedButton(
                              onPressed: () {
                                StoreProvider.of<AppState>(context).dispatch(
                                  DeleteNoteAction(index),
                                );
                              },
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
