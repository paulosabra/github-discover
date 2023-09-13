part of 'search_repository_bloc.dart';

sealed class SearchRepositoryEvent extends Equatable {
  const SearchRepositoryEvent();

  @override
  List<Object> get props => [];
}

class SearchRepositoryInitialEvent extends SearchRepositoryEvent {}

class SearchRepositorySearchEvent extends SearchRepositoryEvent{
  const SearchRepositorySearchEvent();
}