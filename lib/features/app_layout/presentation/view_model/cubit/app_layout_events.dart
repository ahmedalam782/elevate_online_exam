sealed class AppLayoutEvents {}

class ChangeIndexEvent extends AppLayoutEvents {
  final int index;

  ChangeIndexEvent(this.index);
}

class LogoutEvent extends AppLayoutEvents {}