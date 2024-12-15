import 'package:equatable/equatable.dart';

abstract class Video extends Equatable {
  final int videoId;
  final String videoUrl;
  final String duration;
  final String resolution;
  final String fileSize;
  final int lessonId;

  Video({
    required this.videoId,
    required this.videoUrl,
    required this.duration,
    required this.resolution,
    required this.fileSize,
    required this.lessonId,
  });

  @override
  List<Object?> get props => [
        videoId,
        videoUrl,
        duration,
        resolution,
        fileSize,
        lessonId,
      ];
}
