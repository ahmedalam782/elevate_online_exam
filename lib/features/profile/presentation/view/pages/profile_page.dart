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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = getIt.get<ProfileCubit>()..doIntent(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>.value(
      value: profileCubit,
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
                  const ProfileForm(),
                  const SizedBox(height: 16),
                  CustomButton(
                    isLoading:
                        state.updateProfileDataState?.state ==
                        StateType.loading,
                    onTap:
                        state.profileDataChangeState?.isChanged == true &&
                            state.getProfileDataState?.state ==
                                StateType.success
                        ? () {
                            final formState =
                                profileCubit.profileFormKey.currentState;
                            if (formState != null && formState.validate()) {
                              profileCubit.doIntent(UpdateProfileDataEvent());
                            }
                          }
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
