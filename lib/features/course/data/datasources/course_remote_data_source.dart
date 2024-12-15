import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/course_details_model.dart';

abstract class CourseRemoteDataSource {
  Future<CourseDetailsModel> getCourseDetails(String id);
}

class CourseRemoteDataSourceImpl extends CourseRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CourseRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<CourseDetailsModel> getCourseDetails(String id) async {
    final response = await _apiConsumer.get(EndPoints.getEnrollmentCourse(id));
    return CourseDetailsModel.fromJson(response['enrollment']);
  }
}
