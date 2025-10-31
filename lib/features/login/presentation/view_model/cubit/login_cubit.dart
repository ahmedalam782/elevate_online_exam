import 'package:elevate_online_exam/features/login/domain/use_cases/login_user_use_case.dart';
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

  LoginUserUseCase _loginUserUseCase;

  void validateThenLogin() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        // start to login
        
       
      } else {
        // shouldn't do the api login call
      }
    }
  }
}
