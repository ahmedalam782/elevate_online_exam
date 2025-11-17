// TODO: presentation ExploreStates

import 'package:equatable/equatable.dart';

import '../../../../../core/config/base_state/base_state.dart';

class ExploreState extends Equatable {
  final GetAllSubjects? getAllSubjects;
  const ExploreState({this.getAllSubjects});

  ExploreState copyWith({GetAllSubjects? getAllSubjects}) {
    return ExploreState(getAllSubjects: getAllSubjects ?? this.getAllSubjects);
  }

  @override
  List<Object?> get props => [getAllSubjects];
}

class GetAllSubjects extends BaseState {
  const GetAllSubjects({super.state, super.exception, super.data});

  @override
  List<Object?> get props => [state, exception, data];

  @override
  String toString() {
    return 'GetAllSubjects{state: $state, exception: $exception, data: $data}';
  }
}
