part of 'repositories_search_bloc.dart';

sealed class RepositoriesSearchEvent extends Equatable {
  const RepositoriesSearchEvent();

  @override
  List<Object> get props => [];
}

class RepositorySearchEvent extends RepositoriesSearchEvent {
  final String searchString;

  const RepositorySearchEvent({
    required this.searchString,
  });
}
