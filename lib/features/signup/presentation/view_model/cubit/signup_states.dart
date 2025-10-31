// TODO: presentation SignupStates
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';

class SignupStates extends BaseState<UserEntity> {
  SignupStates.all({super.exception, super.data, required super.state})
    : super.all();

  SignupStates copyWith({
    StateType? state,
    UserEntity? data,
    Exception? exception,
  }) {
    return SignupStates.all(
      state: state ?? this.state,
      data: data ?? this.data,
      exception: exception ?? this.exception,
    );
  }
}
