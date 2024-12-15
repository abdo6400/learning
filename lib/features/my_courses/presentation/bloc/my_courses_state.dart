part of 'my_courses_bloc.dart';

abstract class MyCoursesState extends Equatable {
  const MyCoursesState();

  @override
  List<Object> get props => [];
}

class MyCoursesInitial extends MyCoursesState {}

class MyCoursesLoading extends MyCoursesState {}

class MyCoursesError extends MyCoursesState {
  final String message;

  MyCoursesError(this.message);
}

class MyCoursesSuccess extends MyCoursesState {
  final List<MyCourse> myCourses;

  MyCoursesSuccess({required this.myCourses});
}
