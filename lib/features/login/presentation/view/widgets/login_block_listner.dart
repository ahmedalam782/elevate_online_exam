import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_toast.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';


class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        state.loginState.when(
          success: (data) {
            context.goNamed(Routes.home);
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
