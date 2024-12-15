import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/course_details.dart';
import 'course_class_model.dart';

class CourseDetailsModel extends CourseDetails {
  CourseDetailsModel(
      {required super.enrollmentId,
      required super.enrollmentDate,
      required super.course});
  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsModel(
        enrollmentId: json[ApiKeys.enrollmentId],
        enrollmentDate: DateTime.parse(json[ApiKeys.enrollmentDate]),
        course: CourseClassModel.fromJson(json[ApiKeys.course]),
      );
}
