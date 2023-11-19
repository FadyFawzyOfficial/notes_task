part of 'add_note_cubit.dart';

enum AddNoteStatus {
  initial,
  loading,
  success,
  failure,
}

class AddNoteState {
  final AddNoteStatus addNoteStatus;
  final String message;

  AddNoteState({
    required this.addNoteStatus,
    required this.message,
  });

  AddNoteState copyWith({
    AddNoteStatus? addNoteStatus,
    String? message,
  }) {
    return AddNoteState(
      addNoteStatus: addNoteStatus ?? this.addNoteStatus,
      message: message ?? this.message,
    );
  }

  factory AddNoteState.initial() =>
      AddNoteState(addNoteStatus: AddNoteStatus.initial, message: '');

  @override
  String toString() =>
      'AddNoteState(addNoteStatus: $addNoteStatus, message: $message)';
}
