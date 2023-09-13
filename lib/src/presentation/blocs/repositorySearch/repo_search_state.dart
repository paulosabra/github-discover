part of 'repo_search_bloc.dart';

sealed class RepoSearchState extends Equatable {
  final Repository? repository;
  const RepoSearchState({
    this.repository,
  });
  
  @override
  List<Object> get props => [];
}

final class RepoSearchInitial extends RepoSearchState {}

class RepoSearchLoadingState extends RepoSearchState {}

class RepoSearchSuccessState extends RepoSearchState {
  const RepoSearchSuccessState({
    required super.repository,
  });
}

class RepoSearchErrorState extends RepoSearchState {
  final String? message;

  const RepoSearchErrorState({
    this.message,
  });
}
