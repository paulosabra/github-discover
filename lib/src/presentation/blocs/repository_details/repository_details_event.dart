part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsEvent extends Equatable {
  const RepositoryDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepositoryDetailsInitialEvent extends RepositoryDetailsEvent {}

class RepositoryDetailsLoadingEvent extends RepositoryDetailsEvent {
  final int repositoryKey;

  const RepositoryDetailsLoadingEvent({
    required this.repositoryKey,
  });
}
