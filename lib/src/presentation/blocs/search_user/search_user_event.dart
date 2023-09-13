part of 'search_user_bloc.dart';

sealed class SearchUserEvent extends Equatable {
  const SearchUserEvent();

  @override
  List<Object> get props => [];
}

class SearchUserInitialEvent extends SearchUserEvent {}

class SearchUserSearchEvent extends SearchUserEvent {
  final String query;

  const SearchUserSearchEvent({
    required this.query,
  });
}