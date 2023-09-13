part of 'user_search_bloc.dart';

sealed class UserSearchState extends Equatable {
  final User? user;
  final int? quantityFound;
  const UserSearchState({
    this.user,
    this.quantityFound,
  });

  @override
  List<Object?> get props => [user];
}

class UserSearchInitial extends UserSearchState {}

class UserSearchLoadingState extends UserSearchState {}

class UserSearchSuccessState extends UserSearchState {
  const UserSearchSuccessState({
    required super.user,
    required super.quantityFound,
  });
}

class UserSearchErrorState extends UserSearchState {
  final String? message;

  const UserSearchErrorState({
    this.message,
  });
}

class UserSearchEmptyState extends UserSearchState {
  final String? message;

  const UserSearchEmptyState({
    this.message,
  });
}
