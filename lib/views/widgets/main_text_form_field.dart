import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  final String label;
  final Function(String?)? onSaved;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;
  final int? maxLines;

  const MainTextFormField({
    super.key,
    required this.label,
    required this.onSaved,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
    this.maxLines,
  });

  @override
  Widget build(context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      initialValue: initialValue,
      maxLines: maxLines,
      validator: (value) =>
          value?.isEmpty ?? true ? 'This field is required' : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
