import 'dart:io';

import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:equatable/equatable.dart';

class ProfileStates extends Equatable {
  final ChangeProfileImageState? changeProfileImageState;
  final ProfileDataChangeState? profileDataChangeState;
  final GetProfileDataState? getProfileDataState;
  final UpdateProfileDataState? updateProfileDataState;
  const ProfileStates({
    this.changeProfileImageState,
    this.profileDataChangeState = const ProfileDataChangeState(
      isChanged: false,
    ),
    this.getProfileDataState,
    this.updateProfileDataState,
  });
  ProfileStates copyWith({
    ChangeProfileImageState? changeProfileImageState,
    ProfileDataChangeState? profileDataChangeState,
    GetProfileDataState? getProfileDataState,
    UpdateProfileDataState? updateProfileDataState,
  }) {
    return ProfileStates(
      changeProfileImageState:
          changeProfileImageState ?? this.changeProfileImageState,
      profileDataChangeState:
          profileDataChangeState ?? this.profileDataChangeState,
      getProfileDataState: getProfileDataState ?? this.getProfileDataState,
      updateProfileDataState:
          updateProfileDataState ?? this.updateProfileDataState,
    );
  }

  @override
  List<Object?> get props => [
    changeProfileImageState,
    profileDataChangeState,
    getProfileDataState,
  ];
}

class ChangeProfileImageState extends Equatable {
  final File imagePath;
  const ChangeProfileImageState({required this.imagePath});

  @override
  List<Object?> get props => [imagePath];

  @override
  String toString() => 'ChangeProfileImageState(imagePath: $imagePath)';
}

class ProfileDataChangeState extends Equatable {
  final bool isChanged;
  const ProfileDataChangeState({required this.isChanged});

  @override
  List<Object?> get props => [isChanged];

  @override
  String toString() => 'UserChangeState(isChanged: $isChanged)';
}

class GetProfileDataState extends BaseState {
  const GetProfileDataState({super.state, super.data, super.exception});
  @override
  List<Object?> get props => [state, data, exception];

  @override
  String toString() =>
      'GetProfileDataState(state: $state, data: $data, exception: $exception)';
}

class UpdateProfileDataState extends BaseState {
  const UpdateProfileDataState({super.state, super.data, super.exception});
  @override
  List<Object?> get props => [state, data, exception];

  @override
  String toString() =>
      'UpdateProfileDataState(state: $state, data: $data, exception: $exception)';
}
