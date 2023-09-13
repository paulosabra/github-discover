part of 'search_repository_bloc.dart';

sealed class SearchRepositoryState extends Equatable {
  final Repository? repository;

  const SearchRepositoryState({
    this.repository
  });
  
  @override
  List<Object> get props => [];
}

final class SearchRepositoryInitial extends SearchRepositoryState {}

class SearchRepositorySuccessState extends SearchRepositoryState {
  const SearchRepositorySuccessState({
    required super.repository
  });
}

class SearchRepositoryErrorState extends SearchRepositoryState {
  final String? message;

  const SearchRepositoryErrorState({
    this.message,
  });
}

