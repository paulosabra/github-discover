part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsState extends Equatable {
  final Repository? repository;

  const RepositoryDetailsState({
    this.repository,
  });

  @override
  List<Object> get props => [];
}

final class RepositoryDetailsInitialState extends RepositoryDetailsState {}

class RepositoryDetailsLoadingInitialState extends RepositoryDetailsState {}

class RepositoryDetailsEmptyState extends RepositoryDetailsState {}

class RepositoryDetailsSuccessState extends RepositoryDetailsState {
  const RepositoryDetailsSuccessState({required super.repository});
}

class RepositoryDettailsErrorState extends RepositoryDetailsState {
  final String? message;

  const RepositoryDettailsErrorState({
    this.message,
  });
}
