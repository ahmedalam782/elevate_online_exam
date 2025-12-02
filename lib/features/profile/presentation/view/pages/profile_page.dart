import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/config/di/injectable_config.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../../core/shared/widgets/custom_button.dart';
import '../../view_model/cubit/profile_cubit.dart';
import '../../view_model/cubit/profile_events.dart';
import '../../view_model/cubit/profile_states.dart';
import '../widgets/profile_form.dart';
import '../widgets/profile_image.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfileCubit profileCubit = getIt.get<ProfileCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => profileCubit..doIntent(GetProfileDataEvent()),
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              profileCubit.doIntent(GetProfileDataEvent());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  ProfileImage(),
                  const SizedBox(height: 16),
                  ProfileForm(),
                  const SizedBox(height: 24),
                  CustomButton(
                    isLoading:
                        state.updateProfileDataState?.state ==
                        StateType.loading,
                    onTap: state.profileDataChangeState?.isChanged == true
                        ? () => profileCubit.doIntent(UpdateProfileDataEvent())
                        : null,
                    title: LocaleKeys.profile_Update.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
