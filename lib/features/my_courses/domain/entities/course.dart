import 'package:equatable/equatable.dart';

abstract class Course extends Equatable {
  final int courseId;
  final String posterUrl;
  final String title;
  final String description;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Course(
      {required this.courseId,
      required this.posterUrl,
      required this.title,
      required this.description,
      required this.price,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [
        courseId,
        posterUrl,
        title,
        description,
        price,
        createdAt,
        updatedAt,
      ];
}
