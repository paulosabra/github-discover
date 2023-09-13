part of 'repository_bloc.dart';

sealed class RepositoryState extends Equatable {

  final Repository? repository;
  final int? founded;


  const RepositoryState({
    this.repository,
    this.founded
  });
  
  @override
  List<Object> get props => [];
}

final class RepositoryInitial extends RepositoryState {}

class RepositoryLoadingState extends RepositoryState {}

class RepositoryEmptyState extends RepositoryState {
  final String? message;

  const RepositoryEmptyState({
    this.message,
  });
}

class RepositorySuccessState extends RepositoryState {
  const RepositorySuccessState({
    required super.repository,
    required super.founded
  });
}

class RepositoryErrorState extends RepositoryState {
  final String? message;

  const RepositoryErrorState({
    this.message,
  });
}
