part of 'repository_bloc.dart';

sealed class RepositoryEvent extends Equatable {
  const RepositoryEvent();

  @override
  List<Object> get props => [];
}

class RepositoryInitalEvent extends RepositoryEvent {}

class RepositoryLoadingEvent extends RepositoryEvent {}
