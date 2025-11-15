sealed class ExploreEvent {}

// Event to get all subjects
class GetAllSubjectsEvent extends ExploreEvent {
  final String? searchText;
  final bool isRefresh;
  GetAllSubjectsEvent({this.searchText, this.isRefresh = false});
}
