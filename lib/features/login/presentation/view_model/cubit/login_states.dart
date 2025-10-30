import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/login/domain/entities/login_response_model.dart';

class LoginStates {
  BaseState<LoginResponseModel>? loginState;

  LoginStates({this.loginState});

  LoginStates copyWith({BaseState<LoginResponseModel>? loginState}) {
    return LoginStates(loginState: loginState ?? this.loginState);
  }
}
