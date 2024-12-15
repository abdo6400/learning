import 'package:e_learning/core/utils/extensions/responsive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../components/my_courses_list.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.ResponsiveValu(kToolbarHeight,
            mobile: kToolbarHeight, tablet: 100, desktop: 50)),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: CircleAvatar(
                    radius: context.ResponsiveValu(20,
                        mobile: 20, tablet: 40, desktop: 50),
                    backgroundImage: AssetImage(Assets.my_courses),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  StringEnums.courses_for_you.name.tr(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: context.ResponsiveValu(17,
                            mobile: 14, tablet: 25, desktop: 30),
                      ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: BlocBuilder<MyCoursesBloc, MyCoursesState>(
                //     builder: (context, state) {
                //       return Text(
                //         "${state is MyCoursesSuccess ? state.myCourses.length.toString() : "0"}" +"-"+
                //             StringEnums.courses.name.tr(),
                //         style: Theme.of(context)
                //             .textTheme
                //             .headlineSmall!
                //             .copyWith(
                //               fontSize: context.ResponsiveValu(17,
                //                   mobile: 14, tablet: 25, desktop: 30),
                //             ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).hintColor.withValues(alpha: 0.5),
            ),
          ),
        ),
      ),
      body: MyCoursesList(),
    );
  }
}
