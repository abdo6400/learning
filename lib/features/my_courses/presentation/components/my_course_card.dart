import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning/core/utils/extensions/responsive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../../domain/entities/my_course.dart';

class MyCourseCard extends StatelessWidget {
  final MyCourse? myCourse;
  const MyCourseCard({super.key, this.myCourse});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.all(0),
      child: Container(
        height: context.ResponsiveValu(140, mobile: 120, tablet: 200),
        child: ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            layout: context.isTablet || context.isDesktop
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 8,
                columnFlex: 15,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: myCourse?.course.posterUrl != null
                              ? CachedNetworkImageProvider(
                                  EndPoints.sourceUrlImage +
                                      myCourse!.course.posterUrl)
                              : AssetImage(Assets.course),
                          fit: BoxFit.fill)),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 12,
                columnFlex: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: context.ResponsiveValu(12,
                        mobile: 10, tablet: 20, desktop: 24),
                    horizontal: context.ResponsiveValu(5,
                        mobile: 5, tablet: 15, desktop: 24),
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(myCourse?.course.title ?? "Title",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: context.ResponsiveValu(16,
                                          mobile: 10, tablet: 30, desktop: 40),
                                    )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(myCourse?.course.description ?? "description",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: context.ResponsiveValu(13,
                                          mobile: 8, tablet: 22, desktop: 30),
                                    )),
                          ],
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  padding: WidgetStatePropertyAll(
                                      EdgeInsets.all(10)),
                                ),
                            onPressed: () => context.push(AppRoutes.course,
                                extra: myCourse?.course.courseId.toString()),
                            child: Text(StringEnums.watch_course.name.tr())),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
