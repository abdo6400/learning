


import 'package:equatable/equatable.dart';

import 'lesson.dart';

abstract class CourseClass extends Equatable {
  final int courseId;
  final String posterUrl;
  final String title;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Section> sections;

  CourseClass(
      {required this.courseId,
      required this.posterUrl,
      required this.title,
      required this.description,
      required this.price,
      required this.createdAt,
      required this.updatedAt,
      required this.sections});

  @override
  List<Object?> get props => [
        courseId,
        posterUrl,
        title,
        description,
        price,
        createdAt,
        updatedAt,
        sections
      ];
}
