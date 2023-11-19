import 'package:flutter/material.dart';

import 'widgets/app_bar_button.dart';
import 'widgets/notes_fab.dart';
import 'widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          AppBarButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: const NotesListView(),
      floatingActionButton: const NotesFab(),
    );
  }
}
