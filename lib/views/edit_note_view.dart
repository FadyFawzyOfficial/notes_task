import 'package:flutter/material.dart';

import 'widgets/app_bar_button.dart';
import 'widgets/note_form.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          AppBarButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: NoteForm(),
      ),
    );
  }
}
