import 'package:equatable/equatable.dart';

import 'course.dart';

abstract class MyCourse extends Equatable {
  final int enrollmentId;
  final DateTime enrollmentDate;
  final Course course;

  MyCourse(
      {required this.enrollmentId,
      required this.enrollmentDate,
      required this.course});

  @override
  List<Object?> get props => [enrollmentId, enrollmentDate, course];
}
