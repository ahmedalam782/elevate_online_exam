class ExamEntity {
  final String id; 
  final String title;
  final String subject;

  final int? duration; 
  final int? numberOfQuestions; 
  final bool? active;
  final DateTime? createdAt;

  ExamEntity({
    required this.id,
    required this.title,
    required this.subject,
    this.duration,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });
}