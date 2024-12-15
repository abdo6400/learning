part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetCourseDetailsEvent extends CourseEvent {
  final String id;
  GetCourseDetailsEvent({required this.id});
}
