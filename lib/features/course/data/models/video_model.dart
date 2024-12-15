import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/video.dart';

class VideoModel extends Video {
  VideoModel(
      {required super.videoId,
      required super.videoUrl,
      required super.duration,
      required super.resolution,
      required super.fileSize,
      required super.lessonId});

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        videoId: json[ApiKeys.videoId],
        videoUrl: json[ApiKeys.videoUrl],
        duration: json[ApiKeys.duration],
        resolution: json[ApiKeys.resolution],
        fileSize: json[ApiKeys.fileSize],
        lessonId: json[ApiKeys.lessonId],
      );
}
