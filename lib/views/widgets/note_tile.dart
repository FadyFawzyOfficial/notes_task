import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/decorations.dart';
import '../../cubits/notes/notes_cubit.dart';
import '../../models/note.dart';
import '../edit_note_view.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Color(note.color),
      shape: kRoundedRectangleBorder16,
      child: ListTile(
        shape: kRoundedRectangleBorder16,
        contentPadding: const EdgeInsets.all(16),
        title: Text(note.title),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                note.description,
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.black45),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_rounded,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {
            note.delete();
            context.read<NotesCubit>().getNotes();
          },
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(note: note),
          ),
        ),
      ),
    );
  }
}
