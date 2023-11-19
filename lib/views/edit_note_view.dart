import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/notes/notes_cubit.dart';
import '../models/note.dart';
import 'widgets/app_bar_button.dart';
import 'widgets/note_form.dart';

class EditNoteView extends StatelessWidget {
  final Note note;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          AppBarButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {
              if (isFormValid) {
                editNote();
                context.read<NotesCubit>().getNotes();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NoteForm(
          title: note.title,
          description: note.description,
          formKey: formKey,
          titleController: titleController,
          descriptionController: descriptionController,
        ),
      ),
    );
  }

  bool get isFormValid {
    var form = formKey.currentState;
    if (form == null || !form.validate()) return false;

    form.save();
    return true;
  }

  void editNote() {
    note.title = titleController.text;
    note.description = descriptionController.text;
    note.save();
  }
}
