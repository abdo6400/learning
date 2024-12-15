import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/api_keys.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../core/entities/pagination_params.dart';
import '../models/answer_model.dart';
import '../models/answers_model.dart';
import '../models/question_model.dart';
import '../models/questions_model.dart';

abstract class QuestionAndAnswerRemoteDataSource {
  Future<QuestionsModel> getQuestions(PaginationParams params, String lessonId);
  Future<AnswersModel> getAnswers(PaginationParams params, String questionId);

  Future<QuestionModel> addQuestion(String lessonId, String question);
  Future<AnswerModel> addAnswer(
      String lessonQuestionId, String lessonId, String answer);

  Future<void> updateQuestion(String questionId, String question);
  Future<void> updateAnswer(String answerId, String answer);

  Future<void> deleteQuestion(String questionId);
  Future<void> deleteAnswer(String answerId);
}

class QuestionAndAnswerRemoteDataSourceImpl
    extends QuestionAndAnswerRemoteDataSource {
  final ApiConsumer _apiConsumer;

  QuestionAndAnswerRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<AnswerModel> addAnswer(
      String lessonQuestionId, String lessonId, String answer) async {
    final response = await _apiConsumer.post(
      EndPoints.addAnswer(lessonQuestionId),
      body: {ApiKeys.answer: answer, ApiKeys.lessonId: lessonId},
    );
    return AnswerModel.fromJson(response);
  }

  @override
  Future<QuestionModel> addQuestion(String lessonId, String question) async {
    final response = await _apiConsumer.post(
      EndPoints.addQuestion(lessonId),
      body: {ApiKeys.question: question},
    );
    return QuestionModel.fromJson(response);
  }

  @override
  Future<void> deleteAnswer(String answerId) async {
    await _apiConsumer.delete(EndPoints.deleteAnswer(answerId));
  }

  @override
  Future<void> deleteQuestion(String questionId) async {
    await _apiConsumer.delete(EndPoints.deleteQuestion(questionId));
  }

  @override
  Future<AnswersModel> getAnswers(
      PaginationParams params, String questionId) async {
    final response = await _apiConsumer.get(
      EndPoints.getAllAnswers(questionId, params.page, params.limit),
    );
    return AnswersModel.fromJson(response);
  }

  @override
  Future<QuestionsModel> getQuestions(
      PaginationParams params, String lessonId) async {
    final response = await _apiConsumer.get(
      EndPoints.getAllQuestions(lessonId, params.page, params.limit),
    );
    return QuestionsModel.fromJson(response);
  }

  @override
  Future<void> updateAnswer(String answerId, String answer) async {
    await _apiConsumer.patch(
      EndPoints.updateAnswer(answerId),
      body: {ApiKeys.answer: answer},
    );
  }

  @override
  Future<void> updateQuestion(String questionId, String question) async {
    await _apiConsumer.patch(
      EndPoints.updateQuestion(questionId),
      body: {ApiKeys.question: question},
    );
  }
}
