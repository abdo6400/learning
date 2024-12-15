import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int lessonQuestionId;
  final String question;
  final DateTime createdAt;
  final String userName;

  Question({
    required this.lessonQuestionId,
    required this.question,
    required this.createdAt,
    required this.userName,
  });

  @override
  List<Object?> get props => [lessonQuestionId, question, createdAt, userName];
}
