part of 'details_repository_bloc.dart';

sealed class DetailsRepositoryEvent extends Equatable {
  const DetailsRepositoryEvent();

  @override
  List<Object> get props => [];
}

class ShowDetailsRepositoryEvent extends DetailsRepositoryEvent {
  const ShowDetailsRepositoryEvent();
}