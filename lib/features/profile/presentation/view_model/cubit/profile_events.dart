import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class ProfileEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeProfileImageEvent extends ProfileEvents {
  final File imagePath;
  ChangeProfileImageEvent({required this.imagePath});

  @override
  List<Object?> get props => [imagePath];
}


class ProfileDataChangedEvent extends ProfileEvents {
  final bool isChanged;
  ProfileDataChangedEvent({required this.isChanged});

  @override
  List<Object?> get props => [isChanged];
}

class GetProfileDataEvent extends ProfileEvents {
  @override
  List<Object?> get props => [];
}

class UpdateProfileDataEvent extends ProfileEvents {
  @override
  List<Object?> get props => [];
}
