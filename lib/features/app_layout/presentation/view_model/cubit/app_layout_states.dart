import 'package:equatable/equatable.dart';

class AppLayoutStates extends Equatable {
  final ChangeIndexState? changeIndexState;
  const AppLayoutStates({
    this.changeIndexState = const ChangeIndexState(currentIndex: 0),
  });

  AppLayoutStates copyWith({ChangeIndexState? changeIndexState}) {
    return AppLayoutStates(
      changeIndexState: changeIndexState ?? this.changeIndexState,
    );
  }

  @override
  List<Object?> get props => [changeIndexState];

  @override
  String toString() =>
      'AppLayoutStates( changeIndexState: $changeIndexState f)';
}

class ChangeIndexState extends Equatable {
  final int currentIndex;
  const ChangeIndexState({this.currentIndex = 0});

  @override
  List<Object?> get props => [currentIndex];

  @override
  String toString() => 'ChangeIndexState(currentIndex: $currentIndex)';
}
