import 'package:flutter/material.dart';

import 'main_elevated_button.dart';
import 'note_form.dart';

class NotesBottomSheet extends StatelessWidget {
  const NotesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const NoteForm(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: MainElevatedButton(
                label: 'Add',
                isLoading: false,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
