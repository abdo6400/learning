import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/usecases/use_case.dart';
import '../entities/course_details.dart';
import '../repositories/course_repository.dart';

class GetCourseDetailsUseCase
    extends UseCase<Either<Failure, CourseDetails>, String> {
  final CourseRepository _courseRepository;

  GetCourseDetailsUseCase(this._courseRepository);

  @override
  Future<Either<Failure, CourseDetails>> call(String params) =>
      _courseRepository.getCourseDetails(params);
}
