import 'package:dartz/dartz.dart';

import '../../../../../config/database/api/api_keys.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../entities/note.dart';
import '../../repositories/notes_repository.dart';

class AddNoteUsecase extends UseCase<Either<Failure, Note>, AddNoteParams> {
  final NotesRepository repository;
  AddNoteUsecase(this.repository);
  @override
  Future<Either<Failure, Note>> call(AddNoteParams params) async {
    return await repository.createNote(params.toMap());
  }
}

class AddNoteParams {
  final String title;
  final String content;
    final String lessonId;

  AddNoteParams({required this.title, required this.content, required this.lessonId});

  Map<String, dynamic> toMap() => {
        ApiKeys.title: title,
        ApiKeys.content: content,
        ApiKeys.lessonId: lessonId
      };
}
