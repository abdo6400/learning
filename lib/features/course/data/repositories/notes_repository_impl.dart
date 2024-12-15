import 'package:dartz/dartz.dart';

import 'package:e_learning/config/database/error/failures.dart';

import 'package:e_learning/features/course/domain/entities/note.dart';

import '../../../../config/database/error/exceptions.dart';
import '../../domain/repositories/notes_repository.dart';
import '../datasources/notes_remote_data_source.dart';

class NotesRepositoryImpl extends NotesRepository {
  final NotesRemoteDataSource _notesRemoteDataSource;

  NotesRepositoryImpl({required NotesRemoteDataSource notesRemoteDataSource})
      : _notesRemoteDataSource = notesRemoteDataSource;

  @override
  Future<Either<Failure, Note>> createNote(Map<String, dynamic> note) async {
    try {
      return Right(await _notesRemoteDataSource.createNote(note));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(String id) async {
    try {
      return Right(await _notesRemoteDataSource.deleteNote(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getAllNotes(String id) async {
    try {
      return Right(await _notesRemoteDataSource.getAllNotes(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(Map<String, dynamic> note) async {
    try {
      return Right(await _notesRemoteDataSource.updateNote(note));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message.toString()));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
