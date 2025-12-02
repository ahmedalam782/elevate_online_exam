import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_toast.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_cubit.dart';
import 'package:elevate_online_exam/features/change_password/presentation/view_model/cubit/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class ChangePasswordBlocListener extends StatelessWidget {
  const ChangePasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordStates>(
      listenWhen: (previous, current) =>
      previous.changePasswordState != current.changePasswordState,
      listener: (context, state) {
        state.changePasswordState.when(
          success: (data) {
            CustomToast(
              context: context,
              description: LocaleKeys.change_password_password_changed_successfully.tr(),
              type: ToastificationType.success,
            ).showToast();
          },
          loading: () {
             CircularProgressIndicator();
          },
          error: (exception) {
            CustomToast(
              context: context,
              description: handleError(exception),
              type: ToastificationType.error,
            ).showToast();
          },
          initial: () {
             CircularProgressIndicator();
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
