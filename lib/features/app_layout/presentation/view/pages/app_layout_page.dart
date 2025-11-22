import 'dart:developer';

import 'package:elevate_online_exam/core/config/local/hive_strings.dart';
import 'package:elevate_online_exam/features/exams_tap/data/models/exam_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/config/di/injectable_config.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/cubit/app_layout_cubit.dart';
import '../../view_model/cubit/app_layout_states.dart';
import '../widgets/bottom_nav_bar.dart';

class AppLayoutPage extends StatefulWidget {
  AppLayoutPage({super.key});

  @override
  State<AppLayoutPage> createState() => _AppLayoutPageState();
}

class _AppLayoutPageState extends State<AppLayoutPage> {
  final AppLayoutCubit cubit = getIt<AppLayoutCubit>();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    final box = getIt<Box<ExamDto>>(instanceName: "examsBox");
    log(box.values.first.questions?.first.question.toString() ?? "No question");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<AppLayoutCubit, AppLayoutStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: cubit.titles[state.changeIndexState?.currentIndex ?? 0],
              textColor: AppColors.primaryLight,
            ),
            body: IndexedStack(
              index: state.changeIndexState?.currentIndex ?? 0,
              children: cubit.pages,
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        },
      ),
    );
  }
}
