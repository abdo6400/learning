import 'package:dartz/dartz.dart';

import '../../../../../config/database/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../entities/note.dart';
import '../../repositories/notes_repository.dart';

class GetAllNotesUsecase extends UseCase<Either<Failure, List<Note>>, String> {
  final NotesRepository _notesRepository;
  GetAllNotesUsecase(this._notesRepository);
  @override
  Future<Either<Failure, List<Note>>> call(String params) {
    return _notesRepository.getAllNotes(params);
  }
}
