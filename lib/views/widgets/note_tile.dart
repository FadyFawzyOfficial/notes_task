import 'package:flutter/material.dart';

import '../../constants/decorations.dart';
import '../edit_note_view.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key});

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.amber,
      shape: kRoundedRectangleBorder16,
      child: ListTile(
        shape: kRoundedRectangleBorder16,
        contentPadding: const EdgeInsets.all(16),
        title: const Text('Flutter tips'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        subtitle: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Build your career with Fady Fawzy',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Nov 16, 2023',
                style: TextStyle(color: Colors.black45),
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
          onPressed: () {},
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ),
        ),
      ),
    );
  }
}
