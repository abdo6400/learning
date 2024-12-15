import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/entities/pagination_params.dart';
import '../../../../../core/utils/enums/state_enums.dart';
import '../../../domain/entities/questions.dart';
import '../../../domain/usecases/questions/get_questions_usecase.dart';

part 'questions_and_answers_event.dart';
part 'questions_and_answers_state.dart';

class QuestionsAndAnswersBloc
    extends Bloc<QuestionsAndAnswersEvent, QuestionsAndAnswersState> {
  final GetQuestionsUsecase _getQuestionsUsecase;
  QuestionsAndAnswersBloc(this._getQuestionsUsecase)
      : super(QuestionsAndAnswersState()) {
    on<GetQuestions>(_getQuestions);
  }

  void _getQuestions(
      GetQuestions event, Emitter<QuestionsAndAnswersState> emit) async {
    emit(state.copyWith(stateEnums: StateEnum.loading));
    final result = await _getQuestionsUsecase
        .call(GetQuestionsParams(event.paginationParams!, event.lessonId));
    result.fold(
      (failure) => emit(state.copyWith(
          errorMessage: failure.message, stateEnums: StateEnum.error)),
      (questions) => emit(
          state.copyWith(questions: questions, stateEnums: StateEnum.success)),
    );
  }
}
