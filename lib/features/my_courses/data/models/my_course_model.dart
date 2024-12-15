import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/my_course.dart';
import 'course_model.dart';

class MyCourseModel extends MyCourse {
  MyCourseModel({
    required super.enrollmentId,
    required super.enrollmentDate,
    required super.course,
  });

  factory MyCourseModel.fromJson(Map<String, dynamic> json) {
    return MyCourseModel(
      enrollmentId: json[ApiKeys.enrollmentId],
      enrollmentDate: DateTime.parse(json[ApiKeys.enrollmentDate]),
      course: CourseModel.fromJson(json[ApiKeys.course]),
    );
  }
}
