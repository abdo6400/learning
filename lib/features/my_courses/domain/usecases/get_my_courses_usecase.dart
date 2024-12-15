import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/my_course.dart';
import '../repositories/my_courses_repository.dart';

class GetMyCoursesUseCase
    extends UseCase<Either<Failure, List<MyCourse>>, NoParams> {
  final MyCoursesRepository _myCoursesRepository;

  GetMyCoursesUseCase(this._myCoursesRepository);

  @override
  Future<Either<Failure, List<MyCourse>>> call(NoParams params) =>
      _myCoursesRepository.getMyCourses();
}
