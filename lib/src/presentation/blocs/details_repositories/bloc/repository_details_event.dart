part of 'repository_details_bloc.dart';

sealed class RepositoryDetailsEvent extends Equatable {
  const RepositoryDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepositotryDetailsInitalEvent extends RepositoryDetailsEvent {}

class RepositoryDetailsLoadingEvent extends RepositoryDetailsEvent {}
