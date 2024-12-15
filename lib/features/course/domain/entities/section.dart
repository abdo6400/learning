import 'package:equatable/equatable.dart';
import 'video.dart';

abstract class Lesson extends Equatable {
  final int lessonId;
  final String title;
  final int sectionId;
  final List<Video> videos;
  final List<dynamic> documents;
  final List<dynamic> quizzes;

  Lesson({
    required this.lessonId,
    required this.title,
    required this.sectionId,
    required this.videos,
    required this.documents,
    required this.quizzes,
  });

  @override
  List<Object?> get props =>
      [lessonId, title, sectionId, videos, documents, quizzes];
}
