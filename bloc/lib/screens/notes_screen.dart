import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/notes_bloc/notes_event.dart';
import '/notes_bloc/notes_state.dart';
import '/notes_bloc/notes_bloc.dart';

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
              context.read<NotesBloc>().add(AddNote('New Note'));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                if (state is NotesLoading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No notes available. Please add a note."),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                } else if (state is NotesLoaded) {
                  // Display the list of notes once they are loaded.
                  return ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.notes[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // replace the note with "Edited Note"
                                context.read<NotesBloc>().add(EditNote(index, 'Edited Note'));
                              },
                              child: const Text("Edit"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                context.read<NotesBloc>().add(DeleteNote(index));
                              },
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Something went wrong!"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
