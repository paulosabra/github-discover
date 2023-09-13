part of 'repo_search_bloc.dart';

sealed class RepoSearchEvent extends Equatable {
  const RepoSearchEvent();

  @override
  List<Object> get props => [];
}

class RepoSearchInitalEvent extends RepoSearchEvent {}

class RepoSearchSearchEvent extends RepoSearchEvent {
 const RepoSearchSearchEvent();
}

