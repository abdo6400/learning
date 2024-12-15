part of 'questions_and_answers_bloc.dart';

class QuestionsAndAnswersState extends Equatable {
  final Questions? questions;
  final StateEnum stateEnums;
  final String? errorMessage;

  const QuestionsAndAnswersState(
      {this.questions, this.stateEnums = StateEnum.initial, this.errorMessage});

  QuestionsAndAnswersState copyWith({
    Questions? questions,
    StateEnum? stateEnums,
    String? errorMessage,
  }) {
    return QuestionsAndAnswersState(
      questions: questions ?? this.questions,
      stateEnums: stateEnums ?? this.stateEnums,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [questions!, stateEnums, errorMessage!];
}
