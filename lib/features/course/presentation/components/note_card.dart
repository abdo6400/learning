import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/note.dart';

List<Color> colorList = [
  Colors.blue,
  Colors.green,
  Colors.indigo,
  Colors.red,
  Colors.cyan,
  Colors.teal,
  Colors.amber.shade900,
  Colors.deepOrange
];

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.noteData,
    required this.onTapAction,
    required this.onEditAction,
    required this.onDeleteAction,
  });

  final Note? noteData;
  final Function(Note noteData) onTapAction;
  final Function(Note noteData) onEditAction;
  final Function(Note noteData) onDeleteAction;
  @override
  Widget build(BuildContext context) {
    Color color = noteData != null
        ? colorList.elementAt(noteData!.title.length % colorList.length)
        : Theme.of(context).cardColor;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [buildBoxShadow(color, context)],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              if (noteData != null) onTapAction(noteData!);
            },
            splashColor: color.withAlpha(20),
            highlightColor: color.withAlpha(10),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        noteData != null
                            ? '${noteData!.title.trim().length <= 20 ? noteData!.title.trim() : noteData!.title.trim().substring(0, 20) + '...'}'
                            : '......',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: context.ResponsiveValu(16,
                                mobile: 10, tablet: 20, desktop: 24),
                            fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            if (noteData != null) onDeleteAction(noteData!);
                          },
                          child: Icon(Icons.delete_forever,
                              size: context.ResponsiveValu(25,
                                  mobile: 25, tablet: 30, desktop: 35),
                              color: Theme.of(context).colorScheme.error)),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: AutoSizeText(
                        noteData != null ? '${noteData!.content}' : '......',
                        maxLines: 4,
                        minFontSize: context.ResponsiveValu(15,
                            mobile: 10, tablet: 20, desktop: 24),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  BoxShadow buildBoxShadow(Color color, BuildContext context) {
    return BoxShadow(
        color: color.withAlpha(60), blurRadius: 2, offset: Offset(0, 2));
  }
}
