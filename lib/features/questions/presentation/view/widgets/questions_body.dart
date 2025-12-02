// TODO: presentation QuestionsBody
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/exams_tap/domain/entities/exams_entity.dart';
import 'package:elevate_online_exam/features/explore/domain/entities/subject_entities.dart';
import 'package:elevate_online_exam/features/questions/data/models/answer_dto/answer_dto.dart';
import 'package:elevate_online_exam/features/questions/data/models/question_dto/question_dto.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/answer_entity.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/questions_entity.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/count_down_timer.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/multiple_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/question_stepper.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/singe_choice_container.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/time_out_dialog.dart';
import 'package:elevate_online_exam/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:elevate_online_exam/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:elevate_online_exam/features/result/presentation/view_model/cubit/results_cubit.dart';
import 'package:elevate_online_exam/features/result/presentation/view_model/cubit/results_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class QuestionsBody extends StatefulWidget {
  final ExamEntity examEntity;
  final SubjectEntities subject;

  const QuestionsBody({
    super.key,
    required this.examEntity,
    required this.subject,
  });

  @override
  State<QuestionsBody> createState() => _QuestionsBodyState();
}

class _QuestionsBodyState extends State<QuestionsBody> {
  late PageController controller;
  late QuestionsCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<QuestionsCubit>();
    viewModel.doIntent(GetQuestionsEvent(examId: widget.examEntity.id));
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocConsumer<QuestionsCubit, QuestionsState>(
        listener: (context, state) async {
          if (state.isDone == true) {
            final value = await context.push(
              Routes.examScore,
              extra: widget.examEntity,
            );
            if (value == "startAgain") {
              viewModel.doIntent(
                GetQuestionsEvent(examId: widget.examEntity.id),
              );
            }
          }
        },
        buildWhen: (prev, current) {
          return prev.state != current.state;
        },
        builder: (context, state) {
          if (state.state == StateType.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),

                  /// Header + Countdown - static, doesn't rebuild
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.chevron_left_outlined, size: 36.sp),
                          SizedBox(width: 4.w),
                          Text(
                            LocaleKeys.questions_exam.tr(),
                            style: Styles.medium(context, 20.sp),
                          ),
                        ],
                      ),
                      BlocBuilder<QuestionsCubit, QuestionsState>(
                        buildWhen: (prevstate, currentState) {
                          return prevstate.isDone != currentState.isDone;
                        },
                        builder: (context, state) {
                          if (viewModel.state.isDone == true) {
                            return SizedBox.shrink();
                          }
                          print("ISDONE ${viewModel.state.isDone}");
                          return CountdownTimer(
                            isDone: viewModel.state.isDone,
                            onFinished: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return TimeOutDialog(
                                    examEntity: widget.examEntity,
                                  );
                                },
                              );
                            },
                            // totalMinutes: 1,
                            totalMinutes:
                                viewModel.state.data?.isNotEmpty ?? false
                                ? viewModel.state.data?.first.exam.duration ?? 0
                                : 0,
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  /// Question Stepper - rebuilds only when currentPage changes
                  BlocSelector<QuestionsCubit, QuestionsState, int>(
                    selector: (state) => state.currentPage,
                    builder: (context, currentPage) {
                      return QuestionStepper(
                        currentQuestion: currentPage + 1,
                        totalQuestions: viewModel.state.data?.length ?? 1,
                      );
                    },
                  ),

                  SizedBox(height: 16.h),

                  /// PageView - rebuilds only when data or currentPage changes
                  Expanded(
                    child:
                        BlocSelector<
                          QuestionsCubit,
                          QuestionsState,
                          List<QuestionEntity>?
                        >(
                          selector: (state) => state.data,
                          builder: (context, data) {
                            return PageView.builder(
                              controller: controller,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data?.length,
                              onPageChanged: (page) {
                                // viewModel.doIntent(
                                //   QuestionChanged(currentPage: page),
                                // );
                              },
                              itemBuilder: (context, pageIndex) {
                                final question = data?[pageIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      question?.questionTitle ?? "",
                                      style: Styles.medium(context, 18.sp),
                                    ),
                                    SizedBox(height: 24.h),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: question?.answers?.length ?? 0,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 16.h),
                                      itemBuilder: (_, index) {
                                        final answer = question?.answers[index];
                                        return InkWell(
                                          onTap: () {
                                            print("sdsds");
                                            if (viewModel.state.isDone == true)
                                              return;
                                            viewModel.doIntent(
                                              AnswerSelectedEvent(
                                                index: pageIndex,
                                                selectAnswer: answer?.key ?? "",
                                              ),
                                            );
                                          },
                                          child: SingeChoiCeContainer(
                                            isSelected:
                                                question?.answeredQuestion ==
                                                answer?.key,
                                            answer:
                                                answer ??
                                                AnswerEntity(
                                                  key: "",
                                                  title: "",
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                  ),

                  /// Buttons - static widgets, logic triggers Cubit
                  BlocSelector<QuestionsCubit, QuestionsState, int>(
                    selector: (state) => state.currentPage,

                    builder: (context, state) {
                      final page = viewModel.state.currentPage;
                      final dataLength = viewModel.state.data?.length ?? 0;
                      return Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: page >= dataLength - 1
                                  ? LocaleKeys.questions_view_score.tr()
                                  : LocaleKeys.questions_next.tr(),
                              titleStyle: Styles.medium(
                                context,
                                16.sp,
                                color: AppColors.white,
                              ),
                              backGroundColor: AppColors.prime,
                              radius: 10.r,
                              onTap: () async {
                                if (page >= dataLength - 1) {
                                  await viewModel.doIntent(
                                    SaveExamEvent(exam: widget.examEntity),
                                  );
                                  getIt<ResultsCubit>().doIntent(
                                    GetResultsEvent(),
                                  );

                                  return;
                                }

                                final nextPage = page + 1;
                                controller.animateToPage(
                                  nextPage,
                                  curve: Curves.linear,
                                  duration: Duration(milliseconds: 300),
                                );
                                viewModel.doIntent(
                                  QuestionChanged(currentPage: nextPage),
                                );
                              },
                              elevation: 0,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Visibility.maintain(
                              visible: viewModel.state.currentPage != 0,
                              child: CustomButton(
                                title: LocaleKeys.questions_back.tr(),
                                titleStyle: Styles.medium(
                                  context,
                                  16.sp,
                                  color: AppColors.prime,
                                ),
                                backGroundColor: AppColors.white,
                                borderColor: AppColors.prime,
                                radius: 10.r,
                                onTap: () {
                                  final page = viewModel.state.currentPage;
                                  if (page == 0) return;

                                  final prevPage = page - 1;
                                  controller.animateToPage(
                                    prevPage,
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 300),
                                  );
                                  viewModel.doIntent(
                                    QuestionChanged(currentPage: prevPage),
                                  );
                                },
                                elevation: 0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: 150.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
