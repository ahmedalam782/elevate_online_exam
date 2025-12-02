import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/questions_response/questions_response.dart';
import 'package:hive/hive.dart';

// AnswerDto Adapter
class AnswerDtoAdapter extends TypeAdapter<AnswerDto> {
  @override
  final int typeId = 2;

  @override
  AnswerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnswerDto(answer: fields[0] as String?, key: fields[1] as String?);
  }

  @override
  void write(BinaryWriter writer, AnswerDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// ExamDto Adapter
class ExamDtoAdapter extends TypeAdapter<ExamDto> {
  @override
  final int typeId = 3;

  @override
  ExamDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamDto(
      id: fields[0] as String?,
      title: fields[1] as String?,
      duration: fields[2] as int?,
      subject: fields[3] as String?,
      numberOfQuestions: fields[4] as int?,
      active: fields[5] as bool?,
      createdAt: fields[6] as DateTime?,
      questions: (fields[7] as List?)?.cast<QuestionDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExamDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.subject)
      ..writeByte(4)
      ..write(obj.numberOfQuestions)
      ..writeByte(5)
      ..write(obj.active)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// QuestionDto Adapter
class QuestionDtoAdapter extends TypeAdapter<QuestionDto> {
  @override
  final int typeId = 1;

  @override
  QuestionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionDto(
      answers: (fields[0] as List?)?.cast<AnswerDto>(),
      type: fields[1] as String?,
      id: fields[2] as String?,
      question: fields[3] as String?,
      correct: fields[4] as String?,
      subject: fields[5] as dynamic,
      exam: fields[6] as ExamDto?,
      createdAt: fields[7] as String?,
      answeredQuestion: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.answers)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.correct)
      ..writeByte(5)
      ..write(obj.subject)
      ..writeByte(6)
      ..write(obj.exam)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.answeredQuestion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// QuestionsResponse Adapter
class QuestionsResponseAdapter extends TypeAdapter<QuestionsResponse> {
  @override
  final int typeId = 0;

  @override
  QuestionsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionsResponse(
      message: fields[0] as String?,
      questions: (fields[1] as List?)?.cast<QuestionDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionsResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// Registration helper function
void registerHiveAdapters() {
  Hive.registerAdapter(AnswerDtoAdapter());
  Hive.registerAdapter(ExamDtoAdapter());
  Hive.registerAdapter(QuestionDtoAdapter());
  Hive.registerAdapter(QuestionsResponseAdapter());
}
