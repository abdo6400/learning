import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/my_course_model.dart';

abstract class MyCoursesRemoteDataSource {
  Future<List<MyCourseModel>> getMyCourses();
}

class MyCoursesRemoteDataSourceImpl implements MyCoursesRemoteDataSource {
  final ApiConsumer _apiConsumer;

  MyCoursesRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<List<MyCourseModel>> getMyCourses() async {
    final response = await _apiConsumer.get(EndPoints.getUserEnrollments);

    return List<MyCourseModel>.from(
        response['enrollments'].map((e) => MyCourseModel.fromJson(e)));
  }
}
