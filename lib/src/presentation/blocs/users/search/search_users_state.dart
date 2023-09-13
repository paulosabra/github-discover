part of 'search_users_bloc.dart';

sealed class SearchUsersState extends Equatable {
  final List<User> users;

  const SearchUsersState({
    required this.users,
  });

  @override
  List<Object> get props => [];
}

final class SearchUsersInitial extends SearchUsersState {
  const SearchUsersInitial({required super.users});
}

class SearchUsersErrorState extends SearchUsersState {
  final String errorMessage;

  const SearchUsersErrorState({
    required super.users,
    required this.errorMessage,
  });
}

class SearchUsersEmptyState extends SearchUsersState {
  const SearchUsersEmptyState({required super.users});
}

class SearchUsersLoadingState extends SearchUsersState {
  const SearchUsersLoadingState({required super.users});
}

class SearchUsersSuccessState extends SearchUsersState {
  const SearchUsersSuccessState({required super.users});
}
