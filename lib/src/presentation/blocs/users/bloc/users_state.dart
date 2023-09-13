part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  final Repository? repository;
  final User? user;
  final int? founded;

  const UsersState({this.repository, this.user, this.founded});

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersSuccessState extends UsersState {
  const UsersSuccessState({required super.repository, required super.user, super.founded});
}

class UsersErrorState extends UsersState {
  final String? message;

  const UsersErrorState({
    this.message,
  });
}

class UserEmptyState extends UsersState {
  final String? message;

  const UserEmptyState({
    this.message,
  });
}
