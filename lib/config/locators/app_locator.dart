import '../../core/utils/constants.dart';
import '../../features/course/data/datasources/course_remote_data_source.dart';
import '../../features/course/data/datasources/notes_remote_data_source.dart';
import '../../features/course/data/datasources/question_and_answer_remote_data_source.dart';
import '../../features/course/data/repositories/course_repository_impl.dart';
import '../../features/course/data/repositories/notes_repository_impl.dart';
import '../../features/course/data/repositories/question_and_answer_repository_impl.dart';
import '../../features/course/domain/repositories/course_repository.dart';
import '../../features/course/domain/repositories/notes_repository.dart';
import '../../features/course/domain/repositories/question_and_answer_repository.dart';
import '../../features/course/domain/usecases/get_course_details_usecase.dart';
import '../../features/course/domain/usecases/notes/add_note_usecase.dart';
import '../../features/course/domain/usecases/notes/delete_note_usecase.dart';
import '../../features/course/domain/usecases/notes/edit_note_usecase.dart';
import '../../features/course/domain/usecases/notes/get_all_notes_usecase.dart';
import '../../features/course/domain/usecases/questions/get_questions_usecase.dart';
import '../../features/course/presentation/bloc/course/course_bloc.dart';
import '../../features/course/presentation/bloc/notes/notes_bloc.dart';
import '../../features/course/presentation/bloc/questions_and_answers/questions_and_answers_bloc.dart';
import '../../features/my_courses/data/datasources/my_courses_remote_data_source.dart';
import '../../features/my_courses/data/repositories/my_courses_repository_impl.dart';
import '../../features/my_courses/domain/repositories/my_courses_repository.dart';
import '../../features/my_courses/domain/usecases/get_my_courses_usecase.dart';
import '../../features/my_courses/presentation/bloc/my_courses_bloc.dart';

class AppLocator {
  static Future<void> init() async {
    //my-courses
    locator
        .registerLazySingleton<MyCoursesBloc>(() => MyCoursesBloc(locator()));
    locator.registerLazySingleton<GetMyCoursesUseCase>(
        () => GetMyCoursesUseCase(locator()));
    locator.registerLazySingleton<MyCoursesRepository>(
        () => MyCoursesRepositoryImpl(myCoursesRemoteDataSource: locator()));
    locator.registerLazySingleton<MyCoursesRemoteDataSource>(
        () => MyCoursesRemoteDataSourceImpl(apiConsumer: locator()));

    //course
    locator.registerLazySingleton<CourseBloc>(() => CourseBloc(locator()));
    locator.registerLazySingleton<GetCourseDetailsUseCase>(
        () => GetCourseDetailsUseCase(locator()));
    locator.registerLazySingleton<CourseRepository>(
        () => CourseRepositoryImpl(courseRemoteDataSource: locator()));
    locator.registerLazySingleton<CourseRemoteDataSource>(
        () => CourseRemoteDataSourceImpl(apiConsumer: locator()));

    //notes
    locator.registerLazySingleton<NotesBloc>(
        () => NotesBloc(locator(), locator(), locator(), locator()));
    locator
        .registerLazySingleton<AddNoteUsecase>(() => AddNoteUsecase(locator()));
    locator.registerLazySingleton<EditNoteUsecase>(
        () => EditNoteUsecase(locator()));
    locator.registerLazySingleton<DeleteNoteUsecase>(
        () => DeleteNoteUsecase(locator()));
    locator.registerLazySingleton<GetAllNotesUsecase>(
        () => GetAllNotesUsecase(locator()));
    locator.registerLazySingleton<NotesRepository>(
        () => NotesRepositoryImpl(notesRemoteDataSource: locator()));
    locator.registerLazySingleton<NotesRemoteDataSource>(
        () => NotesRemoteDataSourceImpl(apiConsumer: locator()));
    locator.registerLazySingleton<QuestionsAndAnswersBloc>(
        () => QuestionsAndAnswersBloc(locator()));
    locator.registerLazySingleton<GetQuestionsUsecase>(
        () => GetQuestionsUsecase(locator()));
    locator.registerLazySingleton<QuestionAndAnswerRepository>(() =>
        QuestionAndAnswerRepositoryImpl(
            questionAndAnswerRemoteDataSource: locator()));
    locator.registerLazySingleton<QuestionAndAnswerRemoteDataSource>(
        () => QuestionAndAnswerRemoteDataSourceImpl(apiConsumer: locator()));
  }
}
