import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/routes/routes.dart';
import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../../core/shared/widgets/error_page.dart';
import '../../../../../core/validations/validations.dart';
import '../../view_model/cubit/profile_cubit.dart';
import '../../view_model/cubit/profile_events.dart';
import '../../view_model/cubit/profile_states.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileCubit profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state.getProfileDataState?.state == StateType.loading) {
          return _buildShimmerLoading();
        } else if (state.getProfileDataState?.state == StateType.error) {
          return ErrorPage(
            isConnectionerror: state.getProfileDataState?.exception != null,
            onRefresh: () async {
              profileCubit.doIntent(GetProfileDataEvent());
            },
          );
        } else {
          return Form(
            key: profileCubit.profileFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                ProfileImage(),
                const SizedBox(height: 16),
                CustomTextFormField(
                  controller: profileCubit.userNameController,
                  labelText: LocaleKeys.profile_user_name.tr(),
                  hintText: LocaleKeys.profile_user_name.tr(),
                  textInputType: TextInputType.emailAddress,
                  validator: Validations.validateUserName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: state.profileDataChangeState?.isChanged == true
                      ? null
                      : (value) {
                          profileCubit.doIntent(
                            ProfileDataChangedEvent(isChanged: true),
                          );
                        },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: profileCubit.firstNameController,
                        labelText: LocaleKeys.profile_first_name.tr(),
                        hintText: LocaleKeys.profile_first_name.tr(),
                        textInputType: TextInputType.name,
                        validator: Validations.validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged:
                            state.profileDataChangeState?.isChanged == true
                            ? null
                            : (value) {
                                profileCubit.doIntent(
                                  ProfileDataChangedEvent(isChanged: true),
                                );
                              },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                        controller: profileCubit.lastNameController,
                        labelText: LocaleKeys.profile_last_name.tr(),
                        hintText: LocaleKeys.profile_last_name.tr(),
                        textInputType: TextInputType.name,
                        validator: Validations.validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged:
                            state.profileDataChangeState?.isChanged == true
                            ? null
                            : (value) {
                                profileCubit.doIntent(
                                  ProfileDataChangedEvent(isChanged: true),
                                );
                              },
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: profileCubit.emailController,
                  labelText: LocaleKeys.profile_email.tr(),
                  hintText: LocaleKeys.profile_email.tr(),
                  textInputType: TextInputType.emailAddress,
                  validator: Validations.validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: state.profileDataChangeState?.isChanged == true
                      ? null
                      : (value) {
                          profileCubit.doIntent(
                            ProfileDataChangedEvent(isChanged: true),
                          );
                        },
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    CustomTextFormField(
                      isReadOnly: true,
                      controller: profileCubit.passwordController,
                      labelText: LocaleKeys.login_password_label.tr(),
                      hintText: LocaleKeys.login_password_label.tr(),
                      isObscureText: true,
                    ),
                    InkWell(
                      onTap: () {
                        context.push(Routes.changePassword);
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            LocaleKeys.profile_Change.tr(),
                            style: Styles.semiBold(
                              context,
                              12,
                              color: AppColors.prime,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  maxLength: 11,
                  controller: profileCubit.phoneController,
                  labelText: LocaleKeys.profile_phone_number.tr(),
                  hintText: LocaleKeys.profile_phone_number.tr(),
                  textInputType: TextInputType.phone,
                  validator: (value) =>
                      Validations.validatePhoneNumber(value, 11),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: state.profileDataChangeState?.isChanged == true
                      ? null
                      : (value) {
                          profileCubit.doIntent(
                            ProfileDataChangedEvent(isChanged: true),
                          );
                        },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          // Profile image shimmer
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Username field shimmer
          _buildShimmerField(),
          // First name and last name row
          Row(
            children: [
              Expanded(child: _buildShimmerField()),
              const SizedBox(width: 16),
              Expanded(child: _buildShimmerField()),
            ],
          ),
          // Email field shimmer
          _buildShimmerField(),
          // Password field shimmer
          _buildShimmerField(),
          // Phone field shimmer
          _buildShimmerField(),
        ],
      ),
    );
  }

  Widget _buildShimmerField() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
