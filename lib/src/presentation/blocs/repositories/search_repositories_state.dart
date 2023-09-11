part of 'search_repositories_bloc.dart';

sealed class SearchRepositoriesState extends Equatable {
  final List<Repository> repository;

  const SearchRepositoriesState({
    required this.repository,
  });

  @override
  List<Object> get props => [repository];
}

final class SearchRepositoriesInitial extends SearchRepositoriesState {
  const SearchRepositoriesInitial({required super.repository});
}

final class SearchRepositoriesLoadingState extends SearchRepositoriesState {
  const SearchRepositoriesLoadingState({
    required super.repository,
  });
}

final class SearchRepositoriesSucessState extends SearchRepositoriesState {
  const SearchRepositoriesSucessState({
    required super.repository,
  });
}

final class SearchRepositoriesErrorState extends SearchRepositoriesState {
  final String? error;

  const SearchRepositoriesErrorState({
    this.error,
    required super.repository,
  });
}

final class SearchRepositoriesEmptyState extends SearchRepositoriesState {
  final String? emptyMessage;

  const SearchRepositoriesEmptyState({
    this.emptyMessage,
    required super.repository,
  });
}
