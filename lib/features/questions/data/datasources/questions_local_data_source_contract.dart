import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';

abstract class QuestionsLocalDataSourceContract {
  Future<void> saveExam({required ExamDto exam});
}
