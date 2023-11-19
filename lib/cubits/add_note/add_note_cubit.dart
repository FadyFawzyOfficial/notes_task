import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/strings.dart';
import '../../models/note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteState.initial());

  void addNote({required Note note}) async {
    emit(state.copyWith(addNoteStatus: AddNoteStatus.loading));

    try {
      final notesBox = Hive.box<Note>(kNotesBox);
      await notesBox.add(note);
      emit(state.copyWith(addNoteStatus: AddNoteStatus.success));
    } catch (e) {
      emit(state.copyWith(addNoteStatus: AddNoteStatus.failure, message: '$e'));
    }
  }
}
