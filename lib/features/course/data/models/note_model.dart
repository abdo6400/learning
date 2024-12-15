import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.noteId,
    required super.title,
    required super.content,
    required super.lessonId,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        noteId: json[ApiKeys.noteId],
        title: json[ApiKeys.title],
        content: json[ApiKeys.content],
        lessonId: json[ApiKeys.lessonId],
      );
      
  @override
  NoteModel copyWith({
    int? noteId,
    String? title,
    String? content,
    int? lessonId,
  }) {
    return NoteModel(
      noteId: noteId ?? this.noteId,
      title: title ?? this.title,
      content: content ?? this.content,
      lessonId: lessonId ?? this.lessonId,
    );
  }
}
