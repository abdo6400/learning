part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}

class CourseSuccess extends CourseState {
  final CourseDetails courseDetails;

  const CourseSuccess(this.courseDetails);

  @override
  List<Object> get props => [courseDetails];
}
