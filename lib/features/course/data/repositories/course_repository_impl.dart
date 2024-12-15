import 'package:dartz/dartz.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/entities/course_details.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/course_remote_data_source.dart';

class CourseRepositoryImpl extends CourseRepository {
  final CourseRemoteDataSource _courseRemoteDataSource;
  CourseRepositoryImpl({required CourseRemoteDataSource courseRemoteDataSource})
      : _courseRemoteDataSource = courseRemoteDataSource;
  @override
  Future<Either<Failure, CourseDetails>> getCourseDetails(String id) async {
    try {
      return Right(await _courseRemoteDataSource.getCourseDetails(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
