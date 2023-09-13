part of 'users_search_bloc.dart';

sealed class SearchUsersState extends Equatable {
  final List<User> users;

  const SearchUsersState({required this.users});

  @override
  List<Object> get props => [users];
}

final class SearchUsersInitialState extends SearchUsersState {
  const SearchUsersInitialState({required super.users});
}

final class SearchUsersEmptyState extends SearchUsersState {
  const SearchUsersEmptyState({required super.users});
}
final class SearchUsersLoadingState extends SearchUsersState {
  const SearchUsersLoadingState({required super.users});
}



final class SearchUsersSuccessState extends SearchUsersState {
  const SearchUsersSuccessState({required super.users});
}

class SearchUsersErrorState extends SearchUsersState {
  final String error;

  const SearchUsersErrorState({
    required this.error,
    required super.users,
  });
}
