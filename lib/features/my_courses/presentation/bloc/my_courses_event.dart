part of 'my_courses_bloc.dart';

abstract class MyCoursesEvent extends Equatable {
  const MyCoursesEvent();

  @override
  List<Object> get props => [];
}


class GetMyCoursesEvent extends MyCoursesEvent {}