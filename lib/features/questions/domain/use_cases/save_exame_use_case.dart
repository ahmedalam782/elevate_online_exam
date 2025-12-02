import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/repositories/questions_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveExameUseCase {
  final QuestionsRepositoryContract repo;

  SaveExameUseCase({required this.repo});

  Future<void> call(ExamEntity exam) => repo.saveExamLocally(exam);
}
