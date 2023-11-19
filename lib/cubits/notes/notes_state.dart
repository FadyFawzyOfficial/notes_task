part of 'notes_cubit.dart';

enum NotesStatus {
  initial,
  loading,
  success,
  failure,
}

class NotesState {
  final NotesStatus notesStatus;
  final List<Note> notes;
  final String message;

  NotesState({
    required this.notesStatus,
    required this.notes,
    required this.message,
  });

  NotesState copyWith({
    NotesStatus? notesStatus,
    List<Note>? notes,
    String? message,
  }) {
    return NotesState(
      notesStatus: notesStatus ?? this.notesStatus,
      notes: notes ?? this.notes,
      message: message ?? this.message,
    );
  }

  factory NotesState.initial() =>
      NotesState(notesStatus: NotesStatus.initial, notes: [], message: '');

  @override
  String toString() =>
      'NotesState(notesStatus: $notesStatus, notes: $notes, message: $message)';
}
