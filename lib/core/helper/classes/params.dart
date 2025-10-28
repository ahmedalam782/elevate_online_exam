import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationParams extends Equatable {
  final int page;
  final int limit;

  const PaginationParams({required this.page, required this.limit});

  @override
  List<Object?> get props => [page, limit];
}

class FilterParams extends Equatable {
  final String? searchQuery;

  const FilterParams({this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}
