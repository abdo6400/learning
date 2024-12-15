import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/course_details.dart';

abstract class CourseRepository {
  Future<Either<Failure, CourseDetails>> getCourseDetails(String id);
}
