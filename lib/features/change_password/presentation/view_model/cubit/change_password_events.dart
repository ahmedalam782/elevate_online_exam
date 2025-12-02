sealed class ChangePasswordEvents {
  const ChangePasswordEvents();
  factory ChangePasswordEvents.toggleOldPasswordVisibilityEvent() = ToggleOldPasswordVisibilityEvent;
  factory ChangePasswordEvents.toggleNewPasswordVisibilityEvent() = ToggleNewPasswordVisibilityEvent;
  factory ChangePasswordEvents.toggleConfirmPasswordVisibilityEvent() = ToggleConfirmPasswordVisibilityEvent;
  factory ChangePasswordEvents.submitChangePasswordEvent() = SubmitChangePasswordEvent;

  void when({
    required Function() toggleOldPasswordVisibilityEvent,
    required Function() toggleNewPasswordVisibilityEvent,
    required Function() toggleConfirmPasswordVisibilityEvent,
    required Function() submitChangePasswordEvent,
  }) {
    if (this is ToggleOldPasswordVisibilityEvent) {
      toggleOldPasswordVisibilityEvent();
    } else if (this is ToggleNewPasswordVisibilityEvent) {
      toggleNewPasswordVisibilityEvent();
    } else if (this is ToggleConfirmPasswordVisibilityEvent) {
      toggleConfirmPasswordVisibilityEvent();
    } else if (this is SubmitChangePasswordEvent) {
      submitChangePasswordEvent();
    }
  }
}

class ToggleOldPasswordVisibilityEvent extends ChangePasswordEvents {}
class ToggleNewPasswordVisibilityEvent extends ChangePasswordEvents {}
class ToggleConfirmPasswordVisibilityEvent extends ChangePasswordEvents {}
class SubmitChangePasswordEvent extends ChangePasswordEvents {}