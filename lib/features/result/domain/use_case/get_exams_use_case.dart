import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/result/domain/repositories/result_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamsUseCase {
  final ResultRepositoryContract repo;

  GetExamsUseCase({required this.repo});
  List<ExamEntity> call() => repo.getExams();
}
