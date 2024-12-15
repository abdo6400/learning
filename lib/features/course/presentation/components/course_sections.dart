import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/lesson.dart';
import '../../domain/entities/section.dart';
import '../bloc/cubit/course_cubit.dart';

class CourseSections extends StatelessWidget {
  final List<Section> sections;
  const CourseSections({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemBuilder: (context, index) => BlocBuilder<CourseCubit, Lesson>(
              builder: (context, state) {
                return ExpansionTile(
                    collapsedShape: Border(
                      bottom: BorderSide(color: Theme.of(context).hintColor,width: 0.5),
                    ),
                    shape: Border(
                      bottom: BorderSide(color: Theme.of(context).hintColor,width: 0.5),
                    ),
                    initiallyExpanded: state.lessonId ==
                        sections[index].lessons.first.lessonId,
                    title: Text(
                      sections[index].title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: context.ResponsiveValu(17,
                                mobile: 15, tablet: 21, desktop: 32),
                          ),
                    ),
                    children: sections[index]
                        .lessons
                        .map((e) => ListTile(
                              selected: state.lessonId == e.lessonId,
                              onTap: () =>
                                  context.read<CourseCubit>().update(e),
                              title: Text(e.title),
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: context.ResponsiveValu(16,
                                        mobile: 14, tablet: 20, desktop: 30),
                                  ),
                              trailing: Text(
                                e.videos.first.duration,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: context.ResponsiveValu(14,
                                          mobile: 12, tablet: 18, desktop: 25),
                                    ),
                              ),
                            ))
                        .toList());
              },
            ),
        itemCount: sections.length);
  }
}
