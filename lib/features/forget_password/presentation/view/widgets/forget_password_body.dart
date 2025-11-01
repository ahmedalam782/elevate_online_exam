import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/forget_password_cubit.dart';
import '../../view_model/cubit/forget_password_events.dart';
import '../../view_model/cubit/forget_password_states.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordCubit forgetPasswordCubit = context
        .read<ForgetPasswordCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 30),
              SizedBox(
                height: 3,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end:
                        (forgetPasswordCubit.currentPage + 1) /
                        forgetPasswordCubit.children.length,
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      value: value,
                      backgroundColor: AppColors.grayCF,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.prime,
                      ),
                      minHeight: 3,
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: PageView(
                  onPageChanged: (value) =>
                      forgetPasswordCubit.doIndented(PageChangedEvent(value)),
                  controller: forgetPasswordCubit.pageController,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: forgetPasswordCubit.children,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
