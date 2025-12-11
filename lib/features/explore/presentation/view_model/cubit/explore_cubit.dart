import 'package:elevate_online_exam/core/config/base_state/base_state.dart';
import 'package:elevate_online_exam/features/explore/presentation/view_model/cubit/explore_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/base_response/result.dart';
import '../../../../../core/helper/classes/params.dart';
import '../../../domain/entities/subject_entities.dart';
import '../../../domain/use_cases/get_all_subjects_use_case.dart';
import 'explore_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._getAllSubjectsUseCase) : super(const ExploreState());
  final GetAllSubjectsUseCase _getAllSubjectsUseCase;
  final TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  final int limit = 20;
  List<SubjectEntities> filteredSubjects = [];
  bool isMoreLoading = false;
  Future<void> _getAllSubjects(
    String? searchText, {
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      emit(
        state.copyWith(
          getAllSubjects: const GetAllSubjects(state: StateType.moreLoading),
        ),
      );
    } else {
      currentPage = 1;
      filteredSubjects = [];
      isMoreLoading = false;
      emit(
        state.copyWith(
          getAllSubjects: const GetAllSubjects(state: StateType.loading),
        ),
      );
    }
    final result = await _getAllSubjectsUseCase(
      PaginationParams(page: currentPage, limit: limit),
    );
    switch (result) {
      case Success():
        {
          if (result.data?.isNotEmpty ?? false) {
            if (result.data!.length < limit) {
              isMoreLoading = false;
            } else {
              isMoreLoading = true;
            }
            filteredSubjects.addAll(result.data!);
            currentPage++;
          } else {
            filteredSubjects = filteredSubjects;
            isMoreLoading = false;
          }
          filteredSubjects = searchText?.isEmpty ?? true
              ? filteredSubjects
              : filteredSubjects
                    .where(
                      (subject) => (subject.name).toLowerCase().contains(
                        searchText?.toLowerCase() ?? '',
                      ),
                    )
                    .toList();
          emit(
            state.copyWith(
              getAllSubjects: GetAllSubjects(
                state: StateType.success,
                data: filteredSubjects,
              ),
            ),
          );
        }
        break;
      case Error():
        {
          emit(
            state.copyWith(
              getAllSubjects: GetAllSubjects(
                state: StateType.error,
                exception: result.exception,
              ),
            ),
          );
          isMoreLoading = false;
        }
        break;
    }
  }

  Future<void> doAction(ExploreEvent event) async {
    switch (event) {
      case GetAllSubjectsEvent():
        return _getAllSubjects(
          event.searchText ?? searchController.text,
          isRefresh: event.isRefresh,
        );
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  @override
  void emit(ExploreState state) {
    if (!isClosed) {
      return super.emit(state);
    }
  }
}
