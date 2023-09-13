import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

class RepositoriesSearchState extends Equatable {
  final List<Repository> repository;

  const RepositoriesSearchState({required this.repository});

  @override
  List<Object?> get props => [repository];
}

class RepositoriesSearchInitialState extends RepositoriesSearchState {
  const RepositoriesSearchInitialState({required super.repository});
}

class RepositoriesSearchLoadingState extends RepositoriesSearchState {
  const RepositoriesSearchLoadingState({required super.repository});
}

class RepositoriesSearchEmptyState extends RepositoriesSearchState {
  const RepositoriesSearchEmptyState({required super.repository});
}

class RepositoriesSearchSuccessState extends RepositoriesSearchState {
  const RepositoriesSearchSuccessState({required super.repository});
}

class RepositoriesSearchErrorState extends RepositoriesSearchState {
  final String? error;

  const RepositoriesSearchErrorState({
    this.error,
    required super.repository,
  });
}
