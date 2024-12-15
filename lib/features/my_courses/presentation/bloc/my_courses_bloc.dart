import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/use_case.dart';
import '../../domain/entities/my_course.dart';
import '../../domain/usecases/get_my_courses_usecase.dart';

part 'my_courses_event.dart';
part 'my_courses_state.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  final GetMyCoursesUseCase _getMyCoursesUseCase;
  MyCoursesBloc(this._getMyCoursesUseCase) : super(MyCoursesInitial()) {
    on<GetMyCoursesEvent>((event, emit) async {
      emit(MyCoursesLoading());
      final result = await _getMyCoursesUseCase(NoParams());

      result.fold((failure) => emit(MyCoursesError(failure.message)),
          (myCourses) => emit(MyCoursesSuccess(myCourses: myCourses)));
    });
  }
}
