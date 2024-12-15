part of 'notes_bloc.dart';

final class NotesState extends Equatable {
  final List<Note> notes;
  final StateEnum stateEnums;
  final String? errorMessage;

  const NotesState({
    required this.notes,
    this.stateEnums = StateEnum.initial,
    this.errorMessage,
  });

  NotesState copyWith({
    List<Note>? notes,
    StateEnum? stateEnums,
    String? errorMessage,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      stateEnums: stateEnums ?? this.stateEnums,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [notes, stateEnums, errorMessage];
}
