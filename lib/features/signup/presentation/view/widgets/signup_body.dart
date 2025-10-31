// TODO: presentation SignupBody
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/config/di/injectable_config.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_text_field.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_toast.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/core/validations/validations.dart';
import 'package:elevate_online_exam/features/signup/presentation/view_model/cubit/signup_cubit.dart';
import 'package:elevate_online_exam/features/signup/presentation/view_model/cubit/signup_events.dart';
import 'package:elevate_online_exam/features/signup/presentation/view_model/cubit/signup_states.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  late SignupCubit viewModel;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    viewModel = getIt<SignupCubit>();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: formKey,
        // autovalidateMode:AutovalidateMode. ,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 24.h,
            horizontal: 16.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: viewModel.userNameController,
                  fillColor: AppColors.backgroundLight,

                  hintText: LocaleKeys.signup_enter_you_user_name.tr(),
                  labelWidget: Text(LocaleKeys.signup_user_name.tr()),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: viewModel.firstNameController,

                        maxLine: 1,
                        fillColor: AppColors.backgroundLight,
                        hintText: LocaleKeys.signup_enter_first_name.tr(),
                        labelWidget: Text(LocaleKeys.signup_first_name.tr()),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextFormField(
                        controller: viewModel.lastNameController,

                        fillColor: AppColors.backgroundLight,
                        maxLine: 1,

                        hintText: LocaleKeys.signup_enter_last_name.tr(),
                        labelWidget: Text(LocaleKeys.signup_last_name.tr()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: viewModel.emailController,

                  fillColor: AppColors.backgroundLight,

                  hintText: LocaleKeys.signup_enter_email.tr(),
                  labelWidget: Text(LocaleKeys.signup_email.tr()),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: viewModel.passwordController,

                        fillColor: AppColors.backgroundLight,

                        hintText: LocaleKeys.signup_password.tr(),
                        labelWidget: Text(
                          LocaleKeys.signup_enter_password.tr(),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextFormField(
                        controller: viewModel.confirmPasswordController,

                        fillColor: AppColors.backgroundLight,

                        hintText: LocaleKeys.signup_confirm_password.tr(),
                        labelWidget: Text(
                          LocaleKeys.signup_confirm_password.tr(),
                        ),
                        validator: (value) {
                          return Validations.validatePasswordVerification(
                            value,
                            viewModel.passwordController.text,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: viewModel.phoneController,

                  fillColor: AppColors.backgroundLight,
                  validator: (value) {
                    return Validations.validatePhoneNumber(value, 11);
                  },
                  hintText: LocaleKeys.signup_phone.tr(),
                  labelWidget: Text(LocaleKeys.signup_enter_phone_number.tr()),
                ),
                SizedBox(height: 48.h),
                BlocConsumer<SignupCubit, SignupStates>(
                  listener: (context, state) {
                    if (state.state == StateType.error) {
                      CustomToast(
                        context: context,
                        description: state.exception.toString(),
                        // header: ,
                        type: ToastificationType.error,
                      ).showToast();
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.state == StateType.loading,
                      title: LocaleKeys.signup_sign_up.tr(),
                      backGroundColor: AppColors.prime,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          viewModel.doIntent(SignupUserEvent());
                        }
                      },
                      isGradient: false,
                      radius: 100.r,
                      titleStyle: Styles.medium(
                        context,
                        16.sp,
                        color: Colors.white,
                      ),

                      // isLoading: true,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.signup_already_have_an_account.tr(),
                      style: Styles.regular(context, 16),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      LocaleKeys.signup_login.tr(),
                      style: Styles.medium(
                        context,
                        16,
                      ).copyWith(color: AppColors.prime),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
