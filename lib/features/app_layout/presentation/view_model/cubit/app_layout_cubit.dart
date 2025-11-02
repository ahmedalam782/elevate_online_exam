import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app_layout_events.dart';
import 'app_layout_states.dart';

@injectable
class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(const AppLayoutStates());
  void doIndented(AppLayoutEvents event) {
    switch (event) {
      case ChangeIndexEvent():
        _changeIndex(event.index);
        break;
    }
  }

  void _changeIndex(int index) {
    emit(
      state.copyWith(changeIndexState: ChangeIndexState(currentIndex: index)),
    );
  }
}
