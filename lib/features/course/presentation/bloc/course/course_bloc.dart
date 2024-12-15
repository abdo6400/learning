import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/course_details.dart';
import '../../../domain/usecases/get_course_details_usecase.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourseDetailsUseCase _courseDetailsUseCase;
  CourseBloc(this._courseDetailsUseCase) : super(CourseInitial()) {
    on<GetCourseDetailsEvent>((event, emit) async {
      emit(CourseLoading());
      final result = await _courseDetailsUseCase(event.id);
      result.fold((failure) => emit(CourseError(failure.message)),
          (course) => emit(CourseSuccess(course)));
    });
  }
}
