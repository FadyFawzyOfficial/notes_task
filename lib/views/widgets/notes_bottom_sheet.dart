import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes/notes_cubit.dart';
import '../../extensions/date_formatter.dart';
import '../../models/note.dart';
import 'main_elevated_button.dart';
import 'note_form.dart';

class NotesBottomSheet extends StatefulWidget {
  const NotesBottomSheet({super.key});

  @override
  State<NotesBottomSheet> createState() => _NotesBottomSheetState();
}

class _NotesBottomSheetState extends State<NotesBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late int selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          NoteForm(
            formKey: formKey,
            titleController: titleController,
            descriptionController: descriptionController,
            selectColor: (color) => selectedColor = color.value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: BlocConsumer<NotesCubit, NotesState>(
              listener: (context, state) {
                switch (state.notesStatus) {
                  case NotesStatus.success:
                    Navigator.pop(context);
                  case NotesStatus.failure:
                    debugPrint(state.message);
                  default:
                }
              },
              builder: (context, state) {
                return MainElevatedButton(
                  label: 'Add',
                  isLoading: state.notesStatus == NotesStatus.loading,
                  onPressed: () {
                    if (isFormValid) {
                      final note = Note(
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateTime.now().format(),
                        color: selectedColor,
                      );

                      context.read<NotesCubit>().addNote(note: note);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool get isFormValid {
    var form = formKey.currentState;

    if (form == null || !form.validate()) return false;

    form.save();
    return true;
  }
}
