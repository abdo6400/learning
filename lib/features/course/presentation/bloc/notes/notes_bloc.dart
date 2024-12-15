import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utils/enums/state_enums.dart';
import '../../../domain/entities/note.dart';
import '../../../domain/usecases/notes/add_note_usecase.dart';
import '../../../domain/usecases/notes/delete_note_usecase.dart';
import '../../../domain/usecases/notes/edit_note_usecase.dart';
import '../../../domain/usecases/notes/get_all_notes_usecase.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetAllNotesUsecase _getAllNotesUseCase;
  final AddNoteUsecase _addNoteUsecase;
  final EditNoteUsecase _editNoteUsecase;
  final DeleteNoteUsecase _deleteNoteUsecase;

  NotesBloc(
    this._getAllNotesUseCase,
    this._addNoteUsecase,
    this._editNoteUsecase,
    this._deleteNoteUsecase,
  ) : super(const NotesState(notes: [])) {
    on<GetAllNotes>(_onGetAllNotesEvent);
    on<AddNoteEvent>(_onAddNoteEvent);
    on<EditNoteEvent>(_onEditNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
  }

  void _onGetAllNotesEvent(GetAllNotes event, Emitter<NotesState> emit) async {
    emit(state.copyWith(stateEnums: StateEnum.loading));
    final result = await _getAllNotesUseCase(event.id);
    result.fold(
      (failure) => emit(state.copyWith(
          errorMessage: failure.message, stateEnums: StateEnum.error)),
      (notes) =>
          emit(state.copyWith(notes: notes, stateEnums: StateEnum.success)),
    );
  }

  void _onAddNoteEvent(AddNoteEvent event, Emitter<NotesState> emit) async {
    emit(state.copyWith(stateEnums: StateEnum.adding));
    final result = await _addNoteUsecase(
      AddNoteParams(
        title: event.title,
        content: event.content,
        lessonId: event.lessonId,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
          stateEnums: StateEnum.addError, errorMessage: failure.message)),
      (note) {
        final updatedNotes = List<Note>.from(state.notes)..add(note);
        emit(state.copyWith(notes: updatedNotes, stateEnums: StateEnum.added));
      },
    );
  }

  void _onEditNoteEvent(EditNoteEvent event, Emitter<NotesState> emit) async {
    emit(state.copyWith(stateEnums: StateEnum.updating));
    final result = await _editNoteUsecase(
      EditNoteParams(
        title: event.title,
        content: event.content,
        noteId: event.noteId,
      ),
    );

    result.fold(
      (failure) => emit(state.copyWith(
          stateEnums: StateEnum.updateError, errorMessage: failure.message)),
      (note) {
        final updatedNotes = state.notes.map((note) {
          return note.noteId == event.noteId
              ? note.copyWith(title: event.title, content: event.content)
              : note;
        }).toList();
        emit(
            state.copyWith(notes: updatedNotes, stateEnums: StateEnum.updated));
      },
    );
  }

  void _onDeleteNoteEvent(
      DeleteNoteEvent event, Emitter<NotesState> emit) async {
    emit(state.copyWith(stateEnums: StateEnum.deleting, errorMessage: null));
    final result = await _deleteNoteUsecase(event.id);

    result.fold(
      (failure) => emit(state.copyWith(
          stateEnums: StateEnum.deleteError, errorMessage: failure.message)),
      (_) {
        final updatedNotes = state.notes
            .where((note) => note.noteId.toString() != event.id)
            .toList();
        emit(
            state.copyWith(notes: updatedNotes, stateEnums: StateEnum.deleted));
      },
    );
  }
}
