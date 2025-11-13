import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';

class PaginatedExams {
  PaginatedExams({
    required this.exams,
    required this.currentPage,
    required this.totalPages,
  });
  final List<ExamEntity> exams;
  final int currentPage;
  final int totalPages;
}
