part of 'users_search_bloc.dart';

sealed class UsersSearchState extends Equatable {
  final List<User> users;

  const UsersSearchState({
    required this.users,
  });

  @override
  List<Object> get props => [];
}

final class UsersSearchInitial extends UsersSearchState {
  const UsersSearchInitial({required super.users});
}

class UsersSearchLoadingState extends UsersSearchState {
  const UsersSearchLoadingState({required super.users});
}

class UsersSearchSuccessState extends UsersSearchState {
  const UsersSearchSuccessState({required super.users});
}

class UsersSearchErrorState extends UsersSearchState {
  final String message;

  const UsersSearchErrorState({
    required super.users,
    required this.message,
  });
}

class UsersSearchEmptyState extends UsersSearchState {
  const UsersSearchEmptyState({required super.users});
}
