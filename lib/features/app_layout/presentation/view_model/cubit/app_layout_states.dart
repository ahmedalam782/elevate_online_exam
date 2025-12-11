import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:equatable/equatable.dart';

class AppLayoutStates extends Equatable {
  final LogoutState? logoutState;
  final ChangeIndexState? changeIndexState;
  const AppLayoutStates({
    this.logoutState,
    this.changeIndexState = const ChangeIndexState(currentIndex: 0),
  });

  AppLayoutStates copyWith({
    ChangeIndexState? changeIndexState,
    LogoutState? logoutState,
  }) {
    return AppLayoutStates(
      changeIndexState: changeIndexState ?? this.changeIndexState,
      logoutState: logoutState ?? this.logoutState,
    );
  }

  @override
  List<Object?> get props => [changeIndexState, logoutState];
}

class ChangeIndexState extends Equatable {
  final int currentIndex;
  const ChangeIndexState({this.currentIndex = 0});

  @override
  List<Object?> get props => [currentIndex];

  @override
  String toString() => 'ChangeIndexState(currentIndex: $currentIndex)';
}

class LogoutState extends BaseState {
  const LogoutState({super.state, super.exception});
  @override
  List<Object?> get props => [state, exception];
  @override
  String toString() => 'LogoutState(state: $state, exception: $exception,)';
}
