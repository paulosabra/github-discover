part of 'repo_search_bloc.dart';

sealed class RepoSearchEvent extends Equatable {
  const RepoSearchEvent();

  @override
  List<Object> get props => [];
}

class RepoSearchInitialEvent extends RepoSearchEvent {}

class RepoSearchSearchEvent extends RepoSearchEvent {
  final String repoName;

  const RepoSearchSearchEvent({
    required this.repoName,
  });
}
