import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'app_layout_states.dart';

@injectable
class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(const AppLayoutStates());

  void changeIndex(int index) {
    emit(
      state.copyWith(changeIndexState: ChangeIndexState(currentIndex: index)),
    );
  }
}
