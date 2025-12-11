// TODO: presentation AnswersBody
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/answers/presentation/view/widgets/answer_widget.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswersBody extends StatelessWidget {
  final List<QuestionEntity> questions;

  const AnswersBody({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    print(questions.length);
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            Expanded(
              child: ListView.separated(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questions[index].questionTitle,
                          style: Styles.medium(context, 18),
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, answerIndex) {
                            final answer =
                                questions[index].answers[answerIndex];

                            return AnswerWidget(
                              isCorrectAndNotSelected:
                                  answer.key ==
                                      questions[index].correctAnswer &&
                                  answer.key !=
                                      questions[index].answeredQuestion,
                              answer: answer.title,
                              isSelectedAndCorrect:
                                  answer.key ==
                                      questions[index].answeredQuestion &&
                                  answer.key == questions[index].correctAnswer,
                              isSelectedAndIncorrect:
                                  answer.key ==
                                      questions[index].answeredQuestion &&
                                  answer.key != questions[index].correctAnswer,
                              isIncorrectAndNotSelected:
                                  answer.key !=
                                  questions[index].answeredQuestion,
                              // isCorrect:
                              //     answer.key == questions[index].correctAnswer,
                              // isSelected:
                              //     answer.key ==
                              //     questions[index].answeredQuestion,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16.h);
                          },
                          itemCount: questions[index].answers.length,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.h);
                },
                itemCount: questions.length,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
