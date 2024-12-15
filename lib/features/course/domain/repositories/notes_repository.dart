import 'package:dartz/dartz.dart';

import '../../../../config/database/error/failures.dart';
import '../entities/note.dart';

abstract class NotesRepository {
  Future<Either<Failure, Note>> createNote(Map<String, dynamic> note);
  Future<Either<Failure, void>> updateNote(Map<String, dynamic> note);
  Future<Either<Failure, void>> deleteNote(String id);
  Future<Either<Failure, List<Note>>> getAllNotes(String id);
}
