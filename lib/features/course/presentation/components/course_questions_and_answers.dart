
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/components/error_card.dart';
import '../../../../core/utils/enums/state_enums.dart';
import '../bloc/questions_and_answers/questions_and_answers_bloc.dart';

class CourseQuestionsAndAnswers extends StatelessWidget {
  final int lessonId;
  const CourseQuestionsAndAnswers({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<QuestionsAndAnswersBloc, QuestionsAndAnswersState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.errorMessage != null &&
                state.stateEnums == StateEnum.error) {
              return ErrorCard(
                message: state.errorMessage!,
                onRetry: () {},
              );
            }
            if (state.questions != null &&
                state.questions!.questions.isEmpty &&
                state.stateEnums != StateEnum.loading) {
              return Card();
            }
            return Skeletonizer(
                enabled: state.stateEnums == StateEnum.loading,
                child: ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 20, right: 10, left: 10),
                    itemCount: state.stateEnums != StateEnum.loading
                        ? state.questions!.questions.length + 1
                        : 5,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {},
                          title: Text(
                              state.questions?.questions[index].question ??
                                  "....."),
                        )));
          },
        ),
      ],
    );
  }
}
