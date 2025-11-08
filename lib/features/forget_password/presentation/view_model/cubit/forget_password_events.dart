sealed class ForgetPasswordEvents {}

final class ObscureTextChangedEvent extends ForgetPasswordEvents {
  final String fieldKey;
  ObscureTextChangedEvent(this.fieldKey);
}

final class EmailFormValidChangedEvent extends ForgetPasswordEvents {
  EmailFormValidChangedEvent();
}

final class CodeFormValidChangedEvent extends ForgetPasswordEvents {
  CodeFormValidChangedEvent();
}

final class ResetFormValidChangedEvent extends ForgetPasswordEvents {
  ResetFormValidChangedEvent();
}

final class NextPageEvent extends ForgetPasswordEvents {}

class SendCodeToEmailEvent extends ForgetPasswordEvents {
  SendCodeToEmailEvent();
}

class VerifyCodeEvent extends ForgetPasswordEvents {
  VerifyCodeEvent();
}

class ResetPasswordEvent extends ForgetPasswordEvents {
  ResetPasswordEvent();
}

class ResendCodeToEmailEvent extends ForgetPasswordEvents {
  ResendCodeToEmailEvent();
}
