// TODO: api QuestionsLocalDataSourceImpl
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsLocalDataSourceContract)
class QuestionsLocalDataSourceImpl implements QuestionsLocalDataSourceContract {
  final Box<ExamDto> _examsBox;

  QuestionsLocalDataSourceImpl({
    @Named("examsBox") required Box<ExamDto> examsBox,
  }) : _examsBox = examsBox;

  @override
  Future<void> saveExam({required ExamDto exam}) async {
    _examsBox.add(exam);
  }
}
