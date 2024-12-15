import 'package:equatable/equatable.dart';
import '../../../../core/entities/pagination.dart';
import 'question.dart';

class Questions extends Equatable {
  final List<Question> questions;
  final Pagination pagination;

  Questions({
    required this.questions,
    required this.pagination,
  });

  @override
  List<Object?> get props => [questions, pagination];
}
