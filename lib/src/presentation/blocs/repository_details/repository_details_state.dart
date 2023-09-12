part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsState extends Equatable {
  final Repository? repository;
  const RepositoryDetailsState({
    this.repository,
  });

  @override
  List<Object?> get props => [repository];
}

class RepositoryDetailsInitial extends RepositoryDetailsState {}

class RepositoryDetailsLoadingState extends RepositoryDetailsState {}

class RepositoryDetailsSuccessState extends RepositoryDetailsState {
  const RepositoryDetailsSuccessState({
    required super.repository,
  });
}

class RepositoryDetailsErrorState extends RepositoryDetailsState {
  final String? message;

  const RepositoryDetailsErrorState({
    this.message,
  });
}
