import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/exam/exam.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/questions_response/questions_response.dart';
import 'package:hive/hive.dart';

// -------------------- QuestionsResponse Adapter --------------------
class QuestionsResponseAdapter extends TypeAdapter<QuestionsResponse> {
  @override
  final int typeId = 1;

  @override
  QuestionsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return QuestionsResponse(
      message: fields[1] as String?,
      questions: (fields[3] as List?)?.cast<QuestionDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionsResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.questions);
  }
}

// -------------------- QuestionDto Adapter --------------------
class QuestionDtoAdapter extends TypeAdapter<QuestionDto> {
  @override
  final int typeId = 2;

  @override
  QuestionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return QuestionDto(
      answers: (fields[1] as List?)?.cast<AnswerDto>(),
      type: fields[3] as String?,
      id: fields[5] as String?,
      question: fields[7] as String?,
      correct: fields[9] as String?,
      subject: fields[11],
      exam: fields[13] as Exam?,
      createdAt: fields[15] as String?,
      answeredQuestion: fields[117] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.answers)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.question)
      ..writeByte(9)
      ..write(obj.correct)
      ..writeByte(11)
      ..write(obj.subject)
      ..writeByte(13)
      ..write(obj.exam)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.answeredQuestion);
  }
}

// -------------------- AnswerDto Adapter --------------------
class AnswerDtoAdapter extends TypeAdapter<AnswerDto> {
  @override
  final int typeId = 3;

  @override
  AnswerDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return AnswerDto(answer: fields[1] as String?, key: fields[3] as String?);
  }

  @override
  void write(BinaryWriter writer, AnswerDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(3)
      ..write(obj.key);
  }
}

// -------------------- Exam Adapter --------------------
class ExamAdapter extends TypeAdapter<Exam> {
  @override
  final int typeId = 4;

  @override
  Exam read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Exam(
      id: fields[1] as String?,
      title: fields[3] as String?,
      duration: fields[5] as int?,
      subject: fields[7] as String?,
      numberOfQuestions: fields[9] as int?,
      active: fields[11] as bool?,
      createdAt: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Exam obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.subject)
      ..writeByte(9)
      ..write(obj.numberOfQuestions)
      ..writeByte(11)
      ..write(obj.active)
      ..writeByte(13)
      ..write(obj.createdAt);
  }
}
