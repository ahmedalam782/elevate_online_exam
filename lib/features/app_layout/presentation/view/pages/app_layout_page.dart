
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/config/di/injectable_config.dart';
import '../../../../../core/errors/handle_errors/handle_errors.dart';
import '../../../../../core/helper/user_helper/user_helper.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../../core/shared/widgets/custom_toast.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/cubit/app_layout_cubit.dart';
import '../../view_model/cubit/app_layout_states.dart';
import '../widgets/bottom_nav_bar.dart';

class AppLayoutPage extends StatefulWidget {
  const AppLayoutPage({super.key});

  @override
  State<AppLayoutPage> createState() => _AppLayoutPageState();
}

class _AppLayoutPageState extends State<AppLayoutPage> {
  final AppLayoutCubit cubit = getIt<AppLayoutCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: cubit.titles[state.changeIndexState?.currentIndex ?? 0],
              textColor: AppColors.primaryLight,
            ),
            // body: cubit.pages[state.changeIndexState?.currentIndex ?? 0],
            body: IndexedStack(
              index: state.changeIndexState?.currentIndex ?? 0,
              children: cubit.pages,
            ),
            bottomNavigationBar: BottomNavBar(),
          );
        },
        listener: (context, state) {
          if (state.logoutState?.state == StateType.success) {
            getIt.get<UserHelper>().clearUserData();
            CustomToast(
              context: context,
              header: LocaleKeys.global_logout_success.tr(),
            ).showToast();
          } else if (state.logoutState?.state == StateType.error) {
            bool hasNetworkError = handleNetwork(state.logoutState?.exception);
            CustomToast(
              context: context,
              header: hasNetworkError
                  ? LocaleKeys.global_check_internet.tr()
                  : handleError(state.logoutState?.exception),
              type: ToastificationType.error,
            ).showToast();
          }
        },
      ),
    );
  }
}
