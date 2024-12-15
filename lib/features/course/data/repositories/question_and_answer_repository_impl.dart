import 'package:dartz/dartz.dart';
import '../../../../config/database/error/exceptions.dart';
import '../../../../config/database/error/failures.dart';
import '../../../../core/entities/pagination_params.dart';
import '../../domain/entities/answer.dart';
import '../../domain/entities/answers.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/questions.dart';
import '../../domain/repositories/question_and_answer_repository.dart';
import '../datasources/question_and_answer_remote_data_source.dart';

class QuestionAndAnswerRepositoryImpl implements QuestionAndAnswerRepository {
  final QuestionAndAnswerRemoteDataSource _remoteDataSource;

  QuestionAndAnswerRepositoryImpl(
      {required QuestionAndAnswerRemoteDataSource questionAndAnswerRemoteDataSource})
      : _remoteDataSource = questionAndAnswerRemoteDataSource;

  @override
  Future<Either<Failure, Answer>> addAnswer(
      String lessonQuestionId, String lessonId, String answer) async {
    try {
      return Right(await _remoteDataSource.addAnswer(
          lessonQuestionId, lessonId, answer));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Question>> addQuestion(
      String lessonId, String question) async {
    try {
      return Right(await _remoteDataSource.addQuestion(lessonId, question));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAnswer(String answerId) async {
    try {
      return Right(await _remoteDataSource.deleteAnswer(answerId));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteQuestion(String questionId) async {
    try {
      return Right(await _remoteDataSource.deleteQuestion(questionId));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Answers>> getAnswers(
      PaginationParams params, String questionId) async {
    try {
      return Right(await _remoteDataSource.getAnswers(params, questionId));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Questions>> getQuestions(
      PaginationParams params, String lessonId) async {
    try {
      return Right(await _remoteDataSource.getQuestions(params, lessonId));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAnswer(
      String answerId, String answer) async {
    try {
      return Right(await _remoteDataSource.updateAnswer(answerId, answer));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateQuestion(
      String questionId, String question) async {
    try {
      return Right(
          await _remoteDataSource.updateQuestion(questionId, question));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
