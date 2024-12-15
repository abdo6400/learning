import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../../../../core/entities/pagination_params.dart';
import '../entities/answer.dart';
import '../entities/answers.dart';
import '../entities/question.dart';
import '../entities/questions.dart';

abstract class QuestionAndAnswerRepository {
  Future<Either<Failure, Answers>> getAnswers(
      PaginationParams params, String questionId);
  Future<Either<Failure, Questions>> getQuestions(
      PaginationParams params, String lessonId);
  Future<Either<Failure, Question>> addQuestion(
      String lessonId, String question);
  Future<Either<Failure, Answer>> addAnswer(
      String lessonQuestionId, String lessonId, String answer);
  Future<Either<Failure, void>> updateQuestion(
      String questionId, String question);
  Future<Either<Failure, void>> updateAnswer(String answerId, String answer);
  Future<Either<Failure, void>> deleteQuestion(String questionId);
  Future<Either<Failure, void>> deleteAnswer(String answerId);
}
