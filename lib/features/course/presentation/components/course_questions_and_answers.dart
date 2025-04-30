import 'package:e_learning/config/services/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/components/error_card.dart';
import '../../../../core/utils/enums/state_enums.dart';
import '../bloc/questions_and_answers/questions_and_answers_bloc.dart';
import '../bloc/web_socket_bloc.dart';

class CourseQuestionsAndAnswers extends StatelessWidget {
  final int lessonId;
  const CourseQuestionsAndAnswers({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WebSocketBloc(socketDataSource: WebSocketDataSourceImpl())
            ..add(ConnectEvent()),
      child: Stack(
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
              return BlocBuilder<WebSocketBloc, WebSocketState>(
                builder: (context, state) {
                  if (state is WebSocketConnected) {
                    return StreamBuilder<String>(
                      stream: context
                          .read<WebSocketBloc>()
                          .socketDataSource
                          .getMessageStream(),
                      builder: (context, snapshot) {
                        return Center(
                          child: Text(snapshot.data ?? "No messages yet"),
                        );
                      },
                    );
                  } else if (state is WebSocketDisconnected) {
                    return Center(child: Text("Disconnected"));
                  } else {
                    return Center(child: Text("Connecting..."));
                  }
                },
              );
              return Skeletonizer(
                  enabled: state.stateEnums == StateEnum.loading,
                  child: ListView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, right: 5, left: 5),
                      itemCount: state.stateEnums != StateEnum.loading
                          ? state.questions!.questions.length
                          : 5,
                      itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                (state.questions?.questions[index].userName
                                        .substring(0, 1))
                                    .toString(),
                              ),
                            ),
                            onTap: () {},
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.question_answer)),
                            subtitle: Text(
                                state.questions?.questions[index].question ??
                                    "....."),
                            title: Text(
                                state.questions?.questions[index].userName ??
                                    "....."),
                          )));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            widthFactor: 1,
            child: BlocBuilder<WebSocketBloc, WebSocketState>(
              builder: (context, state) {
                return SizedBox(
                  height: 60,
                  child: Card(
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(child: TextFormField()),
                            IconButton(
                                onPressed: () => context
                                    .read<WebSocketBloc>()
                                    .socketDataSource
                                    .sendMessage("test"),
                                icon: Icon(Icons.send))
                          ],
                        ),
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
