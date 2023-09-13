part of 'details_repository_bloc.dart';

sealed class DetailsRepositoryEvent extends Equatable {
  const DetailsRepositoryEvent();

  @override
  List<Object> get props => [];
}

class DetailsRepositoryInitialEvent extends DetailsRepositoryEvent {}

class ShowDetailsRepositoryEvent extends DetailsRepositoryEvent {
  final int id;

  const ShowDetailsRepositoryEvent({
    required this.id
  });
}