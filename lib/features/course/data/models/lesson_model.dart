import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/section.dart';
import 'video_model.dart';

class LessonModel extends Lesson {
  LessonModel(
      {required super.lessonId,
      required super.title,
      required super.sectionId,
      required super.videos,
      required super.documents,
      required super.quizzes});

  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        lessonId: json[ApiKeys.lessonId],
        title: json[ApiKeys.title],
        sectionId: json[ApiKeys.sectionId],
        videos: List<VideoModel>.from(
            json[ApiKeys.videos].map((x) => VideoModel.fromJson(x))),
        documents: List<dynamic>.from(json[ApiKeys.documents].map((x) => x)),
        quizzes: List<dynamic>.from(json[ApiKeys.quizzes].map((x) => x)),
      );
}
