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
      super(SignupStates());

  Future<void> doIntent(SignupEvents homeEvent) async {
    switch (homeEvent) {
      case SignupUserEvent():
        _signup();
    }
  }

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> _signup() async {
    // I WANT THE CHANGE HERE
    _filleSignupModel();
    emit(SignupStates().copyWith(state: StateType.loading));
    final response = await _signupUserUsecase.call(_filleSignupModel());
    switch (response) {
      case Success<UserEntity>():
        emit(
          SignupStates().copyWith(
            state: StateType.success,
            data: response.data,
          ),
        );

      case Error<UserEntity>():
        emit(
          SignupStates().copyWith(
            state: StateType.error,
            exception: response.exception,
          ),
        );
    }
  }

  SignupPostEntity _filleSignupModel() {
    return SignupPostEntity(
      username: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      rePassword: confirmPasswordController.text,
      phone: phoneController.text,
    );
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
