import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/strings.dart';
import '../../models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesState.initial());

  void getNotes() {
    final notesBox = Hive.box<Note>(kNotesBox);

    emit(
      state.copyWith(
        notesStatus: NotesStatus.success,
        notes: notesBox.values.toList(),
      ),
    );
  }

  void addNote({required Note note}) async {
    emit(state.copyWith(notesStatus: NotesStatus.loading));

    try {
      final notesBox = Hive.box<Note>(kNotesBox);
      await notesBox.add(note);
      getNotes();
    } catch (e) {
      emit(state.copyWith(notesStatus: NotesStatus.failure, message: '$e'));
    }
  }

  Future<void> clear() async {
    await Hive.box<Note>(kNotesBox).clear();
    getNotes();
  }
}
