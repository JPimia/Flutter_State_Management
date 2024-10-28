import 'package:bloc_example/blocs/counter/counter_event.dart';
import 'package:bloc_example/blocs/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/notes_bloc/notes_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            // Edit button (could be hooked up to an edit action).
                            ElevatedButton(
                              onPressed: () {
                                // replace the note with "Edited Note"
                                context
                                    .read<NotesBloc>()
                                    .add(EditNote(index, 'Edited Note'));
                              },
                              child: Text("Edit"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<NotesBloc>()
                                    .add(DeleteNote(index));
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("Something went wrong!"));
                }
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // Add a note when the button is pressed
                  context.read<NotesBloc>().add(AddNote('New Note'));
                },
                child: Text("Add Note"),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
