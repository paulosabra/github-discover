part of 'repo_search_bloc.dart';

sealed class RepoSearchState extends Equatable {
  Repositories? repos;

  RepoSearchState({
    this.repos,
  });

  @override
  List<Object?> get props => [repos];
}

final class RepoSearchInitial extends RepoSearchState {}

final class RepoSearchLoadingState extends RepoSearchState {}

final class RepoSearchSuccessState extends RepoSearchState {
  final Repositories filteredRepos;

  RepoSearchSuccessState({
    required this.filteredRepos,
  }) {
    super.repos = filteredRepos;
  }
}

final class RepoSearchNotFoundState extends RepoSearchState {
  final String? notFoundMessage;

  RepoSearchNotFoundState({
    required this.notFoundMessage,
  });
}
