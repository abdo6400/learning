import 'package:equatable/equatable.dart';

import 'course_class.dart';

abstract class CourseDetails extends Equatable {
  final int enrollmentId;
  final DateTime enrollmentDate;
  final CourseClass course;

  CourseDetails({
    required this.enrollmentId,
    required this.enrollmentDate,
    required this.course,
  });
  @override
  List<Object?> get props => [enrollmentId, enrollmentDate, course];
}
