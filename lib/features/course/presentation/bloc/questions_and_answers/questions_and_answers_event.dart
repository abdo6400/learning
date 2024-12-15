part of 'questions_and_answers_bloc.dart';

sealed class QuestionsAndAnswersEvent extends Equatable {
  const QuestionsAndAnswersEvent();

  @override
  List<Object> get props => [];
}

class GetQuestions extends QuestionsAndAnswersEvent {
  final String lessonId;
  final PaginationParams? paginationParams;
  GetQuestions(
      {this.paginationParams = const PaginationParams(page: 1, limit: 10),
      required this.lessonId});
}
