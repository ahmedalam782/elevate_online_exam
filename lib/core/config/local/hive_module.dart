import 'package:elevate_online_exam/core/config/local/hive_strings.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/adapters/questions_adapters.dart';
import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/questions_response/questions_response.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveInjectableModule {
  @preResolve
  Future<HiveInterface> hive() async {
    await Hive.initFlutter();
    // Register adapters
    Hive.registerAdapter(AnswerDtoAdapter());
    Hive.registerAdapter(ExamDtoAdapter());
    Hive.registerAdapter(QuestionDtoAdapter());
    Hive.registerAdapter(QuestionsResponseAdapter());
    return Hive;
  }

  @preResolve
  @Named("questionsBox")
  Future<Box<QuestionDto>> questionsBox(HiveInterface hive) async {
    return await hive.openBox<QuestionDto>(HiveStrings.questionsBox);
  }

  @preResolve
  @Named("examsBox")
  Future<Box<ExamDto>> examsBox(HiveInterface hive) async {
    return await hive.openBox<ExamDto>(HiveStrings.examsBox);
  }

  @preResolve
  @Named("questionsResponseBox")
  Future<Box<QuestionsResponse>> questionsResponseBox(
    HiveInterface hive,
  ) async {
    return await hive.openBox<QuestionsResponse>(
      HiveStrings.questionsResponseBox,
    );
  }

  @preResolve
  @Named("answersBox")
  Future<Box<AnswerDto>> answersBox(HiveInterface hive) async {
    return await hive.openBox<AnswerDto>(HiveStrings.answersBox);
  }
}
