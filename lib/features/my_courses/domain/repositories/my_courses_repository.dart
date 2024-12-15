import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/my_course.dart';

abstract class MyCoursesRepository {
  Future<Either<Failure, List<MyCourse>>> getMyCourses();
}
