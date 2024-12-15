import '../../../../config/database/api/api_keys.dart';
import '../../../../core/models/pagination_model.dart';
import '../../domain/entities/questions.dart';
import 'question_model.dart';

class QuestionsModel extends Questions {
  QuestionsModel({required super.questions, required super.pagination});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      QuestionsModel(
        questions: List<QuestionModel>.from(
            json[ApiKeys.questions].map((x) => QuestionModel.fromJson(x))),
        pagination: PaginationModel.fromJson(json[ApiKeys.pagination]),
      );
}
