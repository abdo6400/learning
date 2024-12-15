import 'package:e_learning/config/database/api/end_points.dart';
import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class LessonInformation extends StatelessWidget {
  final String url;
  final String title;
  final String description;
  const LessonInformation(
      {super.key,
      required this.url,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: context.ResponsiveValu(15,
                  mobile: 12, tablet: 20, desktop: 32),
            ),
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: context.ResponsiveValu(12,
                  mobile: 10, tablet: 16, desktop: 24),
            ),
        subtitle: Text(description),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(EndPoints.sourceUrlImage + url),
        ),
      ),
    );
  }
}
