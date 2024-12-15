import '../../../../config/database/api/api_consumer.dart';
import '../../../../config/database/api/api_keys.dart';
import '../../../../config/database/api/end_points.dart';
import '../models/note_model.dart';

abstract class NotesRemoteDataSource {
  Future<NoteModel> createNote(Map<String, dynamic> note);
  Future<void> updateNote(Map<String, dynamic> note);
  Future<void> deleteNote(String id);
  Future<List<NoteModel>> getAllNotes(String id);
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final ApiConsumer _apiConsumer;

  NotesRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<NoteModel> createNote(Map<String, dynamic> note) async {
    final response = await _apiConsumer
        .post(EndPoints.addNote(note[ApiKeys.lessonId]), body: note);
    return NoteModel.fromJson(response);
  }

  @override
  Future<void> deleteNote(String id) async {
    await _apiConsumer.delete(EndPoints.deleteNote(id));
    return;
  }

  @override
  Future<List<NoteModel>> getAllNotes(String id) async {
    final response = await _apiConsumer.get(EndPoints.getAllNotes(id));
    return List<NoteModel>.from(
        response[ApiKeys.notes].map((e) => NoteModel.fromJson(e)));
  }

  @override
  Future<void> updateNote(Map<String, dynamic> note) async {
    await _apiConsumer.patch(EndPoints.updateNote(note[ApiKeys.noteId]),
        body: note);
    return;
  }
}
