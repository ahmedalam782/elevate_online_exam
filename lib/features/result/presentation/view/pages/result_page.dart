import 'dart:developer';

import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:elevate_online_exam/features/result/presentation/view/widgets/result_widget.dart';
import 'package:elevate_online_exam/features/result/presentation/view_model/cubit/results_cubit.dart';
import 'package:elevate_online_exam/features/result/presentation/view_model/cubit/results_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final ResultsCubit _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = getIt<ResultsCubit>();
    // do NOT call fetch here if AppLayout triggers fetch on tab change.
    // But it's safe to ensure initial load:
    _viewModel.doIntent(GetResultsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _viewModel,
      child: BlocBuilder<ResultsCubit, ResultsState>(
        builder: (context, state) {
          print("THE LENGTH OF RESULTS ${_viewModel.state.exams.length}");
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.exams.isEmpty) {
            return const Center(child: Text('No results yet'));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: state.exams.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.push(
                    Routes.answers,
                    extra: state.exams[index].questions,
                  );
                },
                child: ResultWidget(examEntity: state.exams[index]),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
          );
        },
      ),
    );
  }
}
