// TODO: data ResultRepositoryImpl

import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/result/data/datasources/result_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/result/domain/repositories/result_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResultRepositoryContract)
class ResultRepositoryImpl implements ResultRepositoryContract {
  final ResultLocalDataSourceContract localDataSourceContract;

  ResultRepositoryImpl({required this.localDataSourceContract});
  @override
  List<ExamEntity> getExams() {
    return localDataSourceContract.getExams().map((value) {
      return value.toEntity();
    }).toList();
  }
}
