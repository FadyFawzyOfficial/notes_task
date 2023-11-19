import 'package:flutter/material.dart';

import 'main_text_form_field.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTextFormField(
          label: 'Title',
          onSaved: (value) {},
        ),
        const SizedBox(height: 16),
        MainTextFormField(
          label: 'Content',
          maxLines: 5,
          onSaved: (value) {},
        ),
      ],
    );
  }
}
