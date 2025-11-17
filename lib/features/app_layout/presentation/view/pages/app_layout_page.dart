import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/di/injectable_config.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/cubit/app_layout_cubit.dart';
import '../../view_model/cubit/app_layout_states.dart';
import '../widgets/bottom_nav_bar.dart';

class AppLayoutPage extends StatelessWidget {
  AppLayoutPage({super.key});
  final AppLayoutCubit cubit = getIt<AppLayoutCubit>();
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
