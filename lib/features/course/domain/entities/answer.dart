import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final int lessonAnswerId;
  final String answer;
  final DateTime createdAt;
  final int lessonQuestionId;
  final String userName;

  Answer({
    required this.lessonAnswerId,
    required this.answer,
    required this.createdAt,
    required this.lessonQuestionId,
    required this.userName,
  });

  @override
  List<Object?> get props => [
        lessonAnswerId,
        answer,
        createdAt,
        lessonQuestionId,
        userName,
      ];
}
