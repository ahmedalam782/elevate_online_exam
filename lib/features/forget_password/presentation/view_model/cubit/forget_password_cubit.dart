import 'package:elevate_online_exam/features/forget_password/presentation/view/widgets/reset_password.dart';
import 'package:elevate_online_exam/features/forget_password/presentation/view_model/cubit/forget_password_events.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/languages/locale_keys.g.dart';
import '../../view/widgets/code_verify.dart';
import '../../view/widgets/email_associated.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(const ForgetPasswordStates());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> codeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  List<Widget> children = [EmailAssociated(), CodeVerify(), ResetPassword()];
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void emit(ForgetPasswordStates state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  void doIndented(ForgetPasswordEvents event) {
    switch (event) {
      case FormValidChangedEvent():
        _formValidChanged(event.formKey);
      case PageChangedEvent():
        _pageChanged(event.currentPage);
      case NextPageEvent():
        _nextPage();
      case ObscureTextChangedEvent():
        _obscureTextChanged(event.fieldKey);
    }
  }

  void _formValidChanged(GlobalKey<FormState> formKey) {
    bool isValid = formKey.currentState?.validate() ?? false;
    emit(
      state.copyWith(
        formValidChangedState: FormValidChangedState(isValid: isValid),
      ),
    );
  }

  void _pageChanged(int index) {
    currentPage = index;
    emit(
      state.copyWith(
        pageChangedState: PageChangedState(currentPage: currentPage),
      ),
    );
  }

  void _nextPage() {
    if (currentPage < children.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      emit(
        state.copyWith(
          pageChangedState: PageChangedState(currentPage: currentPage),
        ),
      );
    }
  }

  void _obscureTextChanged(String fieldType) {
    if (fieldType == LocaleKeys.forget_password_new_password) {
      bool isObscure =
          !(state.obscureNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    } else if (fieldType == LocaleKeys.forget_password_confirm_password) {
      bool isObscure =
          !(state.obscureConfirmNewPasswordTextChangedState?.isObscure ?? true);
      emit(
        state.copyWith(
          obscureConfirmNewPasswordTextChangedState: ObscureTextChangedState(
            isObscure: isObscure,
          ),
        ),
      );
    }
  }

  void _clear() {
    emailController.clear();
    codeController.clear();
    newPasswordController.clear();
    confirmNewPasswordController.clear();
  }

  @override
  Future<void> close() {
    _clear();
    emailController.dispose();
    codeController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    pageController.dispose();
    return super.close();
  }
}
