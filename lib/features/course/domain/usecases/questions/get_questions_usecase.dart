import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/entities/pagination_params.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../entities/questions.dart';
import '../../repositories/question_and_answer_repository.dart';

class GetQuestionsUsecase
    extends UseCase<Either<Failure, Questions>, GetQuestionsParams> {
  final QuestionAndAnswerRepository questionAndAnswerRepository;

  GetQuestionsUsecase(this.questionAndAnswerRepository);

  @override
  Future<Either<Failure, Questions>> call(GetQuestionsParams params) async =>
      await questionAndAnswerRepository.getQuestions(
          params.paginationParams, params.lessonId);
}

class GetQuestionsParams {
  final PaginationParams paginationParams;
  final String lessonId;

  GetQuestionsParams(this.paginationParams, this.lessonId);
}
