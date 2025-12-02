import 'dart:io';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/base_response/result.dart';
import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/helper/classes/params.dart';
import '../../../domain/use_cases/get_profile_data_use_case.dart';
import '../../../domain/use_cases/update_profile_use_case.dart';
import 'profile_events.dart';
import 'profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._getProfileDataUseCase, this._updateProfileUseCase)
    : super(const ProfileStates());
  final GetProfileDataUseCase _getProfileDataUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  void doIntent(ProfileEvents event) {
    switch (event) {
      case ChangeProfileImageEvent():
        _changeProfileImage(event.imagePath);
        break;

      case ProfileDataChangedEvent():
        _profileDataChanged(event.isChanged);
        break;
      case GetProfileDataEvent():
        _getProfileData();
        break;
      case UpdateProfileDataEvent():
        _updateProfileData();
        break;
    }
  }

  Future<void> _getProfileData() async {
    emit(
      state.copyWith(
        getProfileDataState: const GetProfileDataState(
          state: StateType.loading,
        ),
      ),
    );
    final result = await _getProfileDataUseCase();
    switch (result) {
      case Success():
        {
          emit(
            state.copyWith(
              getProfileDataState: GetProfileDataState(
                state: StateType.success,
                data: result.data,
              ),
              profileDataChangeState: const ProfileDataChangeState(
                isChanged: false,
              ),
            ),
          );
          userNameController.text = result.data?.userName ?? '';
          firstNameController.text = result.data?.firstName ?? '';
          lastNameController.text = result.data?.lastName ?? '';
          emailController.text = result.data?.email ?? '';
          phoneController.text = result.data?.phone ?? '';
          passwordController.text = "*********";
        }
        break;
      case Error():
        {
          emit(
            state.copyWith(
              getProfileDataState: GetProfileDataState(
                state: StateType.error,
                exception: result.exception,
              ),
            ),
          );
        }
        break;
    }
  }

  Future<void> _updateProfileData() async {
    if (!profileFormKey.currentState!.validate()) {
      return;
    }
    emit(
      state.copyWith(
        updateProfileDataState: const UpdateProfileDataState(
          state: StateType.loading,
        ),
      ),
    );
    final params = EditProfileParams(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    final result = await _updateProfileUseCase(params);
    switch (result) {
      case Success():
        {
          emit(
            state.copyWith(
              updateProfileDataState: UpdateProfileDataState(
                state: StateType.success,
                data: result.data,
              ),
            ),
          );
          _getProfileData();
        }
        break;
      case Error():
        {
          emit(
            state.copyWith(
              updateProfileDataState: UpdateProfileDataState(
                state: StateType.error,
                exception: result.exception,
              ),
            ),
          );
        }
        break;
    }
  }

  void _changeProfileImage(File imagePath) {
    emit(
      ProfileStates(
        changeProfileImageState: ChangeProfileImageState(imagePath: imagePath),
      ),
    );
  }

  void _profileDataChanged(bool isChanged) {
    emit(
      state.copyWith(
        profileDataChangeState: ProfileDataChangeState(isChanged: isChanged),
      ),
    );
  }

  void _clearControllers() {
    userNameController.clear();
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }

  // !close cubit
  @override
  Future<void> close() {
    _clearControllers();
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    return super.close();
  }

  // ! emit states methods here
  @override
  void emit(ProfileStates state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
