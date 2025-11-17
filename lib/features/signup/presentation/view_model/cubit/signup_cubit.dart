import 'package:elevate_online_exam/core/config/base_response/result.dart';
import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/signup/domain/models/signup_post_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/models/user_entity.dart';
import 'package:elevate_online_exam/features/signup/domain/usecases/signup_user_usecase.dart';
import 'package:elevate_online_exam/features/signup/presentation/view_model/cubit/signup_events.dart';
import 'package:elevate_online_exam/features/signup/presentation/view_model/cubit/signup_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignupCubit extends Cubit<SignupStates> {
  final SignupUserUsecase _signupUserUsecase;

  SignupCubit({required SignupUserUsecase signupUserCase})
    : _signupUserUsecase = signupUserCase,
      super(
        SignupStates.all(
          state: StateType.initial,
          isConfirmPasswordVisible: false,
          isPasswordVisible: false,
        ),
      );

  Future<void> doIntent(SignupEvents event) async => switch (event) {
    SignupUserEvent() => _signup(),
    TogglePassword() => _togglePasswordVisibility(),
    ToggleConfirmPassword() => _toggleConfirmPasswordVisibility(),
  };

  SignupPostEntity get _signupModel => SignupPostEntity(
    username: userNameController.text,
    firstName: firstNameController.text,
    lastName: lastNameController.text,
    email: emailController.text,
    password: passwordController.text,
    rePassword: confirmPasswordController.text,
    phone: phoneController.text,
  );

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> _signup() async {
    // I WANT THE CHANGE HERE

    emit(state.copyWith(state: StateType.loading));
    final response = await _signupUserUsecase.call(_signupModel);
    switch (response) {
      case Success<UserEntity>():
        emit(state.copyWith(state: StateType.success, data: response.data));

      case Error<UserEntity>():
        emit(
          state.copyWith(state: StateType.error, exception: response.exception),
        );
    }
  }

  void _togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  void _toggleConfirmPasswordVisibility() => emit(
    state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
  );
  @override
  Future<void> close() {
    for (final controller in [
      userNameController,
      firstNameController,
      lastNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneController,
    ]) {
      controller.dispose();
    }
    return super.close();
  }
}
