import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view/widgets/change_password_bloc_listener.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view/widgets/change_password_form.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_cubit.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_events.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 16.0.w,
        vertical: 24.0.h,
      ),
      child: Column(
        children: [
          ChangePasswordForm(),
          SizedBox(height: 50.h),
          BlocSelector<ChangePasswordCubit, ChangePasswordStates, BaseState>(
            selector: (state) {
              return state.changePasswordState;
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state.state == StateType.loading,
                title: LocaleKeys.change_password_change_password_button.tr(),
                titleStyle: Styles.medium(context, 16, color: AppColors.white),
                radius: 100.r,
                isGradient: false,
                backGroundColor: AppColors.prime,
                onTap: () {
                  cubit.doIntent(
                    ChangePasswordEvents.submitChangePasswordEvent(),
                  );
                },
              );
            },
          ),
          ChangePasswordBlocListener(),
        ],
      ),
    );
  }
}
