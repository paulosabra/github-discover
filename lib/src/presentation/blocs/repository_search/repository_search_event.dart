part of 'repository_search_bloc.dart';

sealed class RepositorySearchEvent extends Equatable {
  const RepositorySearchEvent();

  @override
  List<Object> get props => [];
}

class RepositorySearchInitialEvent extends RepositorySearchEvent {}

class RepositorySearchLoadingEvent extends RepositorySearchEvent {}

class RepositorySearchEmptyEvent extends RepositorySearchEvent {}

class RepositorySearchQueryEvent extends RepositorySearchEvent {
  final String enteredValue;

  const RepositorySearchQueryEvent({
    required this.enteredValue,
  });
}