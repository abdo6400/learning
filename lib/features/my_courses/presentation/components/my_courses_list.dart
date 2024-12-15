import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/components/error_card.dart';
import '../bloc/my_courses_bloc.dart';
import 'my_course_card.dart';

class MyCoursesList extends StatelessWidget {
  const MyCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBloc, MyCoursesState>(
      builder: (context, state) {
        if (state is MyCoursesError) {
          return ErrorCard(
            message: state.message,
            onRetry: () =>
                context.read<MyCoursesBloc>().add(GetMyCoursesEvent()),
          );
        }
        return Skeletonizer(
          enabled: state is MyCoursesLoading,
          child: ResponsiveGridView.builder(
            itemCount: state is MyCoursesSuccess ? state.myCourses.length : 5,
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            itemBuilder: (context, index) => MyCourseCard(
              myCourse:
                  state is MyCoursesSuccess ? state.myCourses[index] : null,
            ),
            gridDelegate: ResponsiveGridDelegate(
              maxCrossAxisExtent: context.ResponsiveValu(1000,
                  mobile: 300, tablet: 500, desktop: 500),
              mainAxisSpacing:
                  context.ResponsiveValu(20, mobile: 10, tablet: 30),
              crossAxisSpacing:
                  context.ResponsiveValu(20, mobile: 10, tablet: 30),
              childAspectRatio: context.ResponsiveValu(2.5,
                  mobile: 2.5, tablet: 3 / 4, desktop: 3 / 5),
            ),
          ),
        );
      },
    );
  }
}
