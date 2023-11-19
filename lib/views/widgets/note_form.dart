import 'package:flutter/material.dart';

import 'main_text_form_field.dart';

class NoteForm extends StatelessWidget {
  final String title;
  final String description;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const NoteForm({
    super.key,
    this.title = '',
    this.description = '',
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MainTextFormField(
            label: 'Title',
            initialValue: title,
            onSaved: (value) {
              titleController.text = value ?? '';
            },
          ),
          const SizedBox(height: 16),
          MainTextFormField(
            maxLines: 5,
            label: 'Content',
            initialValue: description,
            onSaved: (value) {
              descriptionController.text = value ?? '';
            },
          ),
        ],
      ),
    );
  }
}
