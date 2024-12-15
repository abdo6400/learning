import 'package:equatable/equatable.dart';

abstract class Note extends Equatable {
  final int noteId;
  final String title;
  final String content;
  final int lessonId;

  Note({
    required this.noteId,
    required this.title,
    required this.content,
    required this.lessonId,
  });

  Note copyWith({
    int? noteId,
    String? title,
    String? content,
    int? lessonId,
  });
  @override
  List<Object?> get props => [noteId, title, content, lessonId];
}
