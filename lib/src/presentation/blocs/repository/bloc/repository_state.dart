part of 'repository_bloc.dart';

sealed class RepositoryState extends Equatable {

  final Repository? repository;

  const RepositoryState({
    this.repository
  });
  
  @override
  List<Object> get props => [];
}

final class RepositoryInitial extends RepositoryState {}

class RepositoryLoadingState extends RepositoryState {}

class RepositorySuccessState extends RepositoryState {
  const RepositorySuccessState({
    required super.repository
  });
}

class ProfileErrorState extends RepositoryState {
  final String? message;

  const ProfileErrorState({
    this.message,
  });
}
