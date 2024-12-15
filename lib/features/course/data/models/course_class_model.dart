import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/course_class.dart';
import 'section_model.dart';

class CourseClassModel extends CourseClass {
  CourseClassModel(
      {required super.courseId,
      required super.posterUrl,
      required super.title,
      required super.description,
      required super.price,
      required super.createdAt,
      required super.updatedAt,
      required super.sections});

  factory CourseClassModel.fromJson(Map<String, dynamic> json) =>
      CourseClassModel(
        courseId: json[ApiKeys.courseId],
        posterUrl: json[ApiKeys.posterUrl],
        title: json[ApiKeys.title],
        description: json[ApiKeys.description],
        price: double.parse(json[ApiKeys.price].toString()),
        createdAt: DateTime.parse(json[ApiKeys.createdAt]),
        updatedAt: DateTime.parse(json[ApiKeys.updatedAt]),
        sections: List<SectionModel>.from(
            json[ApiKeys.sections].map((x) => SectionModel.fromJson(x))),
      );
}
