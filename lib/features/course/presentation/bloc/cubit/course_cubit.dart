import 'package:bloc/bloc.dart';

import '../../../domain/entities/section.dart';

class CourseCubit extends Cubit<Lesson> {
  CourseCubit(Lesson lesson) : super(lesson);

  void update(Lesson lesson) => emit(lesson);
}
