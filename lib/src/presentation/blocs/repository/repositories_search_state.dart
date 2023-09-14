part of 'repositories_search_bloc.dart';

sealed class RepositoriesSearchState extends Equatable {
  final List<Repository> repositories;

  const RepositoriesSearchState({
    required this.repositories,
  });

  @override
  List<Object?> get props => [repositories];
}

final class RepositoriesSearchInitial extends RepositoriesSearchState {
  const RepositoriesSearchInitial({required super.repositories});
}

class RepositoriesSearchLoadingState extends RepositoriesSearchState {
  const RepositoriesSearchLoadingState({required super.repositories});
}

class RepositoriesSearchSuccessState extends RepositoriesSearchState {
  const RepositoriesSearchSuccessState({required super.repositories});
}

class RepositoriesSearchErrorState extends RepositoriesSearchState {
  final String? message;

  const RepositoriesSearchErrorState({
    this.message,
    required super.repositories,
  });
}

class RepositoriesSearchEmptyState extends RepositoriesSearchState {
  const RepositoriesSearchEmptyState({required super.repositories});
}
