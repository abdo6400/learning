import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../domain/entities/my_course.dart';
import '../../domain/repositories/my_courses_repository.dart';
import '../datasources/my_courses_remote_data_source.dart';

class MyCoursesRepositoryImpl implements MyCoursesRepository {
  final MyCoursesRemoteDataSource _myCoursesRemoteDataSource;

  MyCoursesRepositoryImpl({required MyCoursesRemoteDataSource myCoursesRemoteDataSource}) : _myCoursesRemoteDataSource = myCoursesRemoteDataSource;


  @override
  Future<Either<Failure, List<MyCourse>>> getMyCourses() async {
    try {
      return Right(await _myCoursesRemoteDataSource.getMyCourses());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
