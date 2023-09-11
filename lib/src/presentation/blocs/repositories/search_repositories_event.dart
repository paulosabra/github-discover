part of 'search_repositories_bloc.dart';

sealed class SearchRepositoriesEvent extends Equatable {
  const SearchRepositoriesEvent();

  @override
  List<Object> get props => [];
}

class SearchRepositoryEvent extends SearchRepositoriesEvent {
  final String searchString;

  const SearchRepositoryEvent({
    required this.searchString,
  });
}
