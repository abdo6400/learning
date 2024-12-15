import 'package:equatable/equatable.dart';

import 'section.dart';

abstract class Section extends Equatable {
  final int sectionId;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int courseId;
  final List<Lesson> lessons;

  Section({
    required this.sectionId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.courseId,
    required this.lessons,
  });

  @override
  List<Object?> get props =>
      [sectionId, title, createdAt, updatedAt, courseId, lessons];
}
