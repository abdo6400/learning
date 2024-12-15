import 'package:dartz/dartz.dart';
import '../../../../../config/database/api/api_keys.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../repositories/notes_repository.dart';

class EditNoteUsecase extends UseCase<Either<Failure, void>, EditNoteParams> {
  final NotesRepository _notesRepository;

  EditNoteUsecase(this._notesRepository);

  @override
  Future<Either<Failure, void>> call(EditNoteParams params) {
    return _notesRepository.updateNote(params.toMap());
  }
}

class EditNoteParams {
  final String title;
  final String content;
  final String noteId;

  EditNoteParams(
      {required this.title, required this.content, required this.noteId});

  Map<String, dynamic> toMap() =>
      {ApiKeys.title: title, ApiKeys.content: content, ApiKeys.noteId: noteId};
}
