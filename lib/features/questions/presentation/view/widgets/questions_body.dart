// TODO: presentation QuestionsBody
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/dummy_data.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/count_down_timer.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/multiple_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/question_stepper.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/singe_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/time_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsBody extends StatefulWidget {
  const QuestionsBody({super.key});

  @override
  State<QuestionsBody> createState() => _QuestionsBodyState();
}

class _QuestionsBodyState extends State<QuestionsBody> {
  late PageController? controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.chevron_left_outlined, size: 36.sp),

                    Text(
                      LocaleKeys.questions_exam.tr(),
                      style: Styles.medium(context, 20.sp),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
                CountdownTimer(
                  onFinished: () {
                    // showDialog(
                    //   barrierDismissible: false,
                    //   context: context,
                    //   builder: (context) {
                    //     return TimeOutDialog();
                    //   },
                    // );
                    print("FINISED");
                  },
                  totalMinutes: 25,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            QuestionStepper(
              currentQuestion: 5,
              totalQuestions: DummyData.getDummyData.length,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (pageViewIndex) {
                  print(pageViewIndex);
                },
                itemCount: DummyData.getDummyData.length,
                itemBuilder: (context, pageViewIndex) {
                  return Column(
                    children: [
                      Text(
                        DummyData.getDummyData[pageViewIndex].question ?? "",
                        style: Styles.medium(context, 18.sp),
                      ),
                      SizedBox(height: 24.h),

                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, listViewIndex) {
                          return SingeChoiCeContainer(
                            isSelected: listViewIndex == 0,
                            answer:
                                DummyData
                                    .getDummyData[pageViewIndex]
                                    .answers?[listViewIndex] ??
                                AnswerDto(),
                          );
                        },
                        separatorBuilder: (context, listViewIndex) {
                          return SizedBox(height: 16.h);
                        },
                        itemCount:
                            DummyData
                                .getDummyData[pageViewIndex]
                                .answers
                                ?.length ??
                            0,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: LocaleKeys.questions_next.tr(),
                    titleStyle: Styles.medium(
                      context,
                      16.sp,
                      color: AppColors.white,
                    ),
                    backGroundColor: AppColors.prime,
                    radius: 10.r,

                    onTap: () {},
                    elevation: 0,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    title: LocaleKeys.questions_back.tr(),
                    titleStyle: Styles.medium(
                      context,
                      16.sp,
                      color: AppColors.prime,
                    ),
                    borderColor: AppColors.prime,
                    radius: 10.r,
                    backGroundColor: AppColors.white,
                    onTap: () {},
                    elevation: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 150.h),
          ],
        ),
      ),
    );
  }
}
