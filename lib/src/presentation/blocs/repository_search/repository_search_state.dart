part of 'repository_search_bloc.dart';

sealed class RepositorySearchState extends Equatable {
  final Repository? repository;
  final int? quantityFound;
  const RepositorySearchState({
    this.repository,
    this.quantityFound,
  });

  @override
  List<Object?> get props => [repository];
}

class RepositorySearchInitial extends RepositorySearchState {}

class RepositorySearchLoadingState extends RepositorySearchState {}

class RepositorySearchSuccessState extends RepositorySearchState {
  const RepositorySearchSuccessState({
    required super.repository,
    required super.quantityFound,
  });
}

class RepositorySearchErrorState extends RepositorySearchState {
  final String? message;

  const RepositorySearchErrorState({
    this.message,
  });
}

class RepositorySearchEmptyState extends RepositorySearchState {
  final String? message;

  const RepositorySearchEmptyState({
    this.message,
  });
}
