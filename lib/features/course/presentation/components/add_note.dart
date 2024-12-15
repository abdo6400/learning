import 'package:e_learning/core/utils/extensions/responsive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/enums/string_enums.dart';

class AddNoteCard extends StatelessWidget {
  final Function() _onTap;
  const AddNoteCard(this._onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              StringEnums.add_note_on_lesson.name.tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: context.ResponsiveValu(16,
                                        mobile: 10, tablet: 20, desktop: 24),
                                  ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
