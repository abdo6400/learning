import 'package:dartz/dartz.dart';
import '../../../../../config/database/error/failures.dart';
import '../../../../../core/usecases/use_case.dart';
import '../../repositories/notes_repository.dart';

class DeleteNoteUsecase extends UseCase<Either<Failure, void>, String> {
  final NotesRepository _notesRepository;
  DeleteNoteUsecase(this._notesRepository);
  @override
  Future<Either<Failure, void>> call(String params) {
    return _notesRepository.deleteNote(params);
  }
}
