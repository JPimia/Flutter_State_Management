import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/notes_provider.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(notesProvider.notifier).addNote("New Note");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: notes.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No notes available. Please add a note."),
                          SizedBox(height: 16),
                        ],
                      ),
                    )
                  :
                  // Display the list of notes once they are loaded.
                  ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(notes[index].content),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // replace the note with "Edited Note"
                                  ref
                                      .read(notesProvider.notifier)
                                      .editNote(index, "Edited Note");
                                },
                                child: const Text("Edit"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  ref
                                      .read(notesProvider.notifier)
                                      .deleteNote(index);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
