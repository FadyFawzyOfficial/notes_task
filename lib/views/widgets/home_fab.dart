import 'package:flutter/material.dart';

import '../../constants/decorations.dart';
import 'notes_bottom_sheet.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: kRoundedRectangleBorder16,
          isScrollControlled: true,
          builder: (context) => const NotesBottomSheet(),
        );
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
