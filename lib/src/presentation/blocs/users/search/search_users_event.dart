part of 'search_users_bloc.dart';

sealed class SearchUsersEvent extends Equatable {
  const SearchUsersEvent();

  @override
  List<Object> get props => [];
}

class SearchUserEvent extends SearchUsersEvent {
  final String searchString;

  const SearchUserEvent({
    required this.searchString,
  });
}
