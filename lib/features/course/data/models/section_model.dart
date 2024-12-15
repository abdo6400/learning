import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/lesson.dart';
import 'lesson_model.dart';

class SectionModel extends Section {
  SectionModel(
      {required super.sectionId,
      required super.title,
      required super.createdAt,
      required super.updatedAt,
      required super.courseId,
      required super.lessons});
  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        sectionId: json[ApiKeys.sectionId],
        title: json[ApiKeys.title],
        createdAt: DateTime.parse(json[ApiKeys.createdAt]),
        updatedAt: DateTime.parse(json[ApiKeys.updatedAt]),
        courseId: json[ApiKeys.courseId],
        lessons: List<LessonModel>.from(
            json[ApiKeys.lessons].map((x) => LessonModel.fromJson(x))),
      );
}
