
import 'package:elevate_online_exam/features/login/domain/use_cases/login_user_use_case.dart';
import 'package:elevate_online_exam/features/login/presentation/view_model/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginUserUseCase) : super(LoginStates());

  LoginUserUseCase _loginUserUseCase;
}
