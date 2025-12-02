import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/base_response/result.dart';
import '../../../../../core/config/base_state/base_state.dart';
import '../../../../../core/languages/locale_keys.g.dart';
import '../../../../explore/presentation/view/pages/explore_page.dart';
import '../../../../profile/presentation/view/pages/profile_page.dart';
import '../../../../result/presentation/view/pages/result_page.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import 'app_layout_events.dart';
import 'app_layout_states.dart';

@injectable
class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit(this._logoutUseCase) : super(const AppLayoutStates());
  final LogoutUseCase _logoutUseCase;
  void doIndented(AppLayoutEvents event) {
    switch (event) {
      case ChangeIndexEvent():
        _changeIndex(event.index);
        break;
      case LogoutEvent():
        _logout();
        break;
    }
  }

  void _logout() async {
    emit(
      state.copyWith(logoutState: const LogoutState(state: StateType.loading)),
    );
    final result = await _logoutUseCase();
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            logoutState: const LogoutState(state: StateType.success),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            logoutState: LogoutState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  List<Widget> pages = [ExplorePage(), ResultPage(), ProfilePage()];
  List<String> titles = [
    LocaleKeys.app_layout_Survey.tr(),
    LocaleKeys.app_layout_Results.tr(),
    LocaleKeys.app_layout_profile.tr(),
  ];
  void _changeIndex(int index) {
    emit(
      state.copyWith(changeIndexState: ChangeIndexState(currentIndex: index)),
    );
  }
}
