import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/core/errors/handle_errors/handle_errors.dart';
import 'package:elevate_online_exam/features/login/data/models/login_request_body.dart';
import 'package:elevate_online_exam/features/login/domain/use_cases/login_user_use_case.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_events.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginUserUseCase) : super(LoginStates());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  final LoginUserUseCase _loginUserUseCase;

  void doIntent(LoginEvents event) {
    event.when(loginUserEvent: _validateThenLogin);
  }

  void _validateThenLogin() async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        // start to login
        emit(state.copyWith(loginState: BaseState.loading()));
        print(" is remeber me in cubit $isRememberMe");
        final result = await _loginUserUseCase.call(
          body: LoginRequestBody(
            email: emailController.text.trim(),
            password: passwordController.text,
          ),
          rememberMe: isRememberMe,
        );

        result.when(
          success: (data) {
            emit(state.copyWith(loginState: BaseState.success(data)));
          },
          error: (error) {
            emit(state.copyWith(loginState: BaseState.error(error)));
          },
        );
      }
    }
  }
}
