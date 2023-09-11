part of 'search_repositories_bloc.dart';

sealed class SearchRepositoriesEvent extends Equatable {
  const SearchRepositoriesEvent();

  @override
  List<Object> get props => [];
}

class RepositorySearchEvent extends SearchRepositoriesEvent {
  final String searchString;

  const RepositorySearchEvent({
    required this.searchString,
  });
}
