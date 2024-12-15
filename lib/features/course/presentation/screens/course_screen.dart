import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:e_learning/features/course/presentation/components/lesson_information.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/components/error_card.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../../domain/entities/section.dart';
import '../bloc/course/course_bloc.dart';
import '../bloc/cubit/course_cubit.dart';
import '../bloc/notes/notes_bloc.dart';
import '../bloc/questions_and_answers/questions_and_answers_bloc.dart';
import '../components/course_notes.dart';
import '../components/course_questions_and_answers.dart';
import '../components/course_sections.dart';
import '../components/video_player_card.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
          ),
          body: BlocConsumer<CourseBloc, CourseState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CourseError) {
                  return ErrorCard(
                    message: state.message,
                    onRetry: () => context.read<CourseBloc>().add(
                        GetCourseDetailsEvent(
                            id: ModalRoute.of(context)!.settings.arguments
                                as String)),
                  );
                } else if (state is CourseSuccess) {
                  return BlocProvider(
                    create: (context) => CourseCubit(state
                        .courseDetails.course.sections.first.lessons.first),
                    child: BlocBuilder<CourseCubit, Lesson>(
                      builder: (context, lesson) {
                        return BlocProvider.value(
                          value: locator<QuestionsAndAnswersBloc>()
                            ..add(GetQuestions(
                                lessonId: lesson.lessonId.toString())),
                          child: BlocProvider.value(
                            value: locator<NotesBloc>()
                              ..add(GetAllNotes(lesson.lessonId.toString())),
                            child: Column(
                              children: [
                                VideoPlayerCard(
                                  key: ValueKey(lesson.lessonId),
                                  video: lesson.videos,
                                  title: lesson.title,
                                ),
                                LessonInformation(
                                  url: state.courseDetails.course.posterUrl,
                                  title: state.courseDetails.course.title,
                                  description:
                                      state.courseDetails.course.description,
                                ),
                                Card(
                                  margin: EdgeInsets.all(0),
                                  elevation: 0,
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: TabBar(
                                      tabAlignment: TabAlignment.start,
                                      indicatorPadding:
                                          EdgeInsetsDirectional.zero,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicator: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary))),
                                      isScrollable: true,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: context.ResponsiveValu(15,
                                                mobile: 13,
                                                tablet: 20,
                                                desktop: 30),
                                          ),
                                      unselectedLabelStyle: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: context.ResponsiveValu(14,
                                                mobile: 12,
                                                tablet: 20,
                                                desktop: 30),
                                          ),
                                      tabs: [
                                        StringEnums.course_content.name.tr(),
                                        StringEnums.tests.name.tr(),
                                        StringEnums.notes.name.tr(),
                                        StringEnums.Q_And_A.name.tr(),
                                      ].map((e) => Tab(text: e)).toList()),
                                ),
                                Expanded(
                                    child: TabBarView(children: [
                                  CourseSections(
                                    sections:
                                        state.courseDetails.course.sections,
                                  ),
                                  Container(),
                                  CourseNotes(
                                    lessonId: lesson.lessonId,
                                  ),
                                  CourseQuestionsAndAnswers(
                                    lessonId: lesson.lessonId,
                                  ),
                                ]))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: SpinKitCubeGrid(
                      color: Theme.of(context).indicatorColor,
                      size: context.ResponsiveValu(30,
                          mobile: 20, tablet: 50, desktop: 70),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
