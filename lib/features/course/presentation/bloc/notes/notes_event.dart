part of 'notes_bloc.dart';

sealed class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotes extends NotesEvent {
  final String id;
  const GetAllNotes(this.id);
}

class AddNoteEvent extends NotesEvent {
  final String title;
  final String content;
  final String lessonId;
  const AddNoteEvent(this.title, this.content, this.lessonId);
}

class EditNoteEvent extends NotesEvent {
  final String title;
  final String content;
  final String noteId;
  const EditNoteEvent(this.title, this.content, this.noteId);
}

class DeleteNoteEvent extends NotesEvent {
  final String id;
  const DeleteNoteEvent(this.id);
}
