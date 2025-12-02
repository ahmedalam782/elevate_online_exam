// TODO: data ResultLocalDataSourceContract

import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';

abstract class ResultLocalDataSourceContract {
  List<ExamDto> getExams();
}
