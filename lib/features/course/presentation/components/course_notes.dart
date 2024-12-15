import 'package:e_learning/core/entities/form.dart';
import 'package:e_learning/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/components/error_card.dart';
import '../../../../core/entities/field.dart';
import '../../../../core/utils/enums/state_enums.dart';
import '../../../../core/utils/enums/string_enums.dart';
import '../bloc/notes/notes_bloc.dart';
import 'add_note.dart';
import 'note_card.dart';

class CourseNotes extends StatelessWidget {
  final int lessonId;
  const CourseNotes({required this.lessonId, super.key});
  void _dialogNoteForm(BuildContext context,
      {String? title,
      String? content,
      required String btnLabel,
      required String titleForm,
      required void Function(Map<String, dynamic>) onSubmit}) {
    final formKey = GlobalKey<FormBuilderState>();
    final List<FieldParams> fields = [
      FieldParams(
        label: StringEnums.noteTitlePlaceholder.name,
        icon: Icons.title_outlined,
        initialValue: title,
        validators: [
          FormBuilderValidators.required(
              errorText: StringEnums.noteTitleRequired.name.tr()),
        ],
      ),
      FieldParams(
        label: StringEnums.noteContentPlaceholder.name,
        icon: Icons.description_outlined,
        initialValue: content,
        maxLines: 3,
        validators: [
          FormBuilderValidators.required(
              errorText: StringEnums.noteContentRequired.name.tr()),
        ],
      ),
    ];
    context.showFormDialog(
        onSubmit: (data) {
          onSubmit(data);
        },
        btnLabel: btnLabel,
        title: titleForm,
        formModel: FormParams(
          formKey: formKey,
          fields: fields,
        ));
  }

  void _onAddNote(BuildContext context) {
    _dialogNoteForm(context,
        btnLabel: StringEnums.add.name,
        titleForm: StringEnums.add_note_on_lesson.name, onSubmit: (data) {
      context.read<NotesBloc>().add(AddNoteEvent(
            data[StringEnums.noteTitlePlaceholder.name],
            data[StringEnums.noteContentPlaceholder.name],
            lessonId.toString(),
          ));
    });
  }

  void _onEditNote(
      BuildContext context, int noteId, String title, String content) {
    _dialogNoteForm(context,
        title: title,
        content: content,
        btnLabel: StringEnums.edit.name,
        titleForm: StringEnums.edit_note_on_lesson.name, onSubmit: (data) {
      context.read<NotesBloc>().add(EditNoteEvent(
            data[StringEnums.noteTitlePlaceholder.name],
            data[StringEnums.noteContentPlaceholder.name],
            noteId.toString(),
          ));
    });
  }

  void _onDeleteNote(BuildContext context, int noteId) {
    context.showConfirmDilog(
        title: StringEnums.are_you_sure_you_want_to_delete.name,
        onSubmit: () {
          context.read<NotesBloc>().add(DeleteNoteEvent(noteId.toString()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesBloc, NotesState>(listener: (context, state) {
      context.handleState(state.stateEnums, state.errorMessage);
    }, builder: (context, state) {
      if (state.errorMessage != null && state.stateEnums == StateEnum.error) {
        return ErrorCard(
          message: state.errorMessage,
          onRetry: () {
            context.read<NotesBloc>().add(GetAllNotes(lessonId.toString()));
          },
        );
      }
      if (state.notes.isEmpty && state.stateEnums != StateEnum.loading) {
        return Container(
            margin: const EdgeInsets.all(15),
            child: AddNoteCard(() => _onAddNote(context)));
      }
      return Skeletonizer(
        enabled: state.stateEnums == StateEnum.loading,
        child: ResponsiveGridView.builder(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            gridDelegate: ResponsiveGridDelegate(
                maxCrossAxisExtent: context.ResponsiveValu(300,
                    mobile: 300, tablet: 350, desktop: 500),
                mainAxisSpacing:
                    context.ResponsiveValu(10, mobile: 10, tablet: 30),
                crossAxisSpacing:
                    context.ResponsiveValu(10, mobile: 10, tablet: 30),
                childAspectRatio: 4 / 3),
            itemCount: state.stateEnums != StateEnum.loading
                ? state.notes.length + 1
                : 5,
            itemBuilder: (context, index) {
              if (index == 0) {
                return AddNoteCard(() => _onAddNote(context));
              }
              return NoteCard(
                noteData: state.stateEnums != StateEnum.loading
                    ? state.notes[index - 1]
                    : null,
                onTapAction: (note) =>
                    _onEditNote(context, note.noteId, note.title, note.content),
                onEditAction: (note) {},
                onDeleteAction: (note) => _onDeleteNote(context, note.noteId),
              );
            }),
      );
    });
  }
}
