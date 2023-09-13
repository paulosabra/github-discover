part of 'users_search_bloc.dart';

sealed class UsersSearchEvent extends Equatable {
  const UsersSearchEvent();

  @override
  List<Object> get props => [];
}

class UserSearchEvent extends UsersSearchEvent {
  final String searchString;

  const UserSearchEvent({
    required this.searchString,
  });
}
