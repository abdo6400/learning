import '../../../../config/database/api/api_keys.dart';
import '../../../../core/models/pagination_model.dart';
import '../../domain/entities/answers.dart';
import 'answer_model.dart';

class AnswersModel extends Answers {
  AnswersModel({required super.answers, required super.pagination});

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        answers: List<AnswerModel>.from(
            json[ApiKeys.answers].map((x) => AnswerModel.fromJson(x))),
        pagination: PaginationModel.fromJson(json[ApiKeys.pagination]),
      );
}
