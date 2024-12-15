import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(
      {required super.lessonQuestionId,
      required super.question,
      required super.createdAt,
      required super.userName});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        lessonQuestionId: json[ApiKeys.lessonQuestionId],
        question: json[ApiKeys.question],
        createdAt: DateTime.parse(json[ApiKeys.createdAt]),
        userName: json[ApiKeys.user][ApiKeys.userName],
      );
}
