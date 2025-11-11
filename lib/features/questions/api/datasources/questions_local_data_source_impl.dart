// TODO: api QuestionsLocalDataSourceImpl
import 'package:elevate_online_exam/features/questions/data/datasources/questions_local_data_source_contract.dart';
import 'package:elevate_online_exam/features/questions/data/datasources/questions_remote_data_source_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QuestionsLocalDataSourceContract)
class QuestionsLocalDataSourceImpl
    implements QuestionsLocalDataSourceContract {}
