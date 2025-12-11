// TODO: api ResultLocalDataSourceImpl

import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/result/data/datasources/result_local_data_source_contract.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultLocalDataSourceContract)
class ResultLocalDataSourceImpl implements ResultLocalDataSourceContract {
  final Box<ExamDto> _examsBox;

  ResultLocalDataSourceImpl({@Named("examsBox") required Box<ExamDto> examsBox})
    : _examsBox = examsBox;

  @override
  List<ExamDto> getExams() {
    return _examsBox.values.toList();
  }
}
