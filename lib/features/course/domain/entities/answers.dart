import 'package:equatable/equatable.dart';
import '../../../../core/entities/pagination.dart';
import 'answer.dart';

class Answers extends Equatable {
  final List<Answer> answers;
  final Pagination pagination;

  Answers({
    required this.answers,
    required this.pagination,
  });

  @override
  List<Object?> get props => [answers, pagination];
}