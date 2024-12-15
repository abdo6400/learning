import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({
    required super.courseId,
    required super.posterUrl,
    required super.title,
    required super.description,
    required super.price,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseId: json[ApiKeys.courseId],
      posterUrl: json[ApiKeys.posterUrl],
      title: json[ApiKeys.title],
      description: json[ApiKeys.description],
      price: double.parse(json[ApiKeys.price].toString()),
      createdAt: DateTime.parse(json[ApiKeys.createdAt]),
      updatedAt: DateTime.parse(json[ApiKeys.updatedAt]),
    );
  }
}
