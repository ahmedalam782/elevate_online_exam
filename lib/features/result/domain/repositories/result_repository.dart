// TODO: domain ResultRepository

import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';

abstract class ResultRepositoryContract {
  List<ExamEntity> getExams();
}
