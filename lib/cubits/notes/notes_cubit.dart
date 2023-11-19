import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/strings.dart';
import '../../models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState.initial());

  void getNotes() async {
    try {
      final notesBox = Hive.box<Note>(kNotesBox);

      emit(
        state.copyWith(
          notesStatus: NotesStatus.success,
          notes: notesBox.values.toList(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          notesStatus: NotesStatus.failure,
          message: '$e',
        ),
      );
    }
  }
}
