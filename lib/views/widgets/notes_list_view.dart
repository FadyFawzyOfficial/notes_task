import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes/notes_cubit.dart';
import 'note_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.notes.length,
          itemBuilder: (context, index) => NoteTile(note: state.notes[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        );
      },
    );
  }
}
