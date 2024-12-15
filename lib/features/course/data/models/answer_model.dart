import '../../../../config/database/api/api_keys.dart';
import '../../domain/entities/answer.dart';

class AnswerModel extends Answer {
  AnswerModel(
      {required super.lessonAnswerId,
      required super.answer,
      required super.createdAt,
      required super.lessonQuestionId,
      required super.userName});

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        lessonAnswerId: json[ApiKeys.lessonAnswerId],
        answer: json[ApiKeys.answer],
        createdAt: DateTime.parse(json[ApiKeys.createdAt]),
        lessonQuestionId: json[ApiKeys.lessonQuestionId],
        userName: json[ApiKeys.user][ApiKeys.userName],
      );
}
