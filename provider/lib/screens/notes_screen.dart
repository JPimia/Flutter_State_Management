import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/notes_provider.dart';

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
              context.read<NotesProvider>().addNote("New Note");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<NotesProvider>(
              builder: (context, notesProvider, child) {
                if (notesProvider.notes.isEmpty) {
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
                  // Display the list of notes once they are loaded.
                  return ListView.builder(
                    itemCount: notesProvider.notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notesProvider.notes[index].content),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Edit button (could be hooked up to an edit action).
                            ElevatedButton(
                              onPressed: () {
                                // replace the note with "Edited Note"
                                notesProvider.editNote(index, "Edited Note");
                              },
                              child: Text("Edit"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                notesProvider.deleteNote(index);
                              },
                              child: Text("Delete"),
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
