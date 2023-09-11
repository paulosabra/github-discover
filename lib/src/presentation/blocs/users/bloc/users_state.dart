part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  
  final Repository? repository;
  final User? user;

  const UsersState({
    this.repository,
    this.user
  });
  
  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersSuccessState extends UsersState {
  const UsersSuccessState({
    required super.repository,
    required super.user
  });
}

class UsersErrorState extends UsersState {
  final String? message;

  const UsersErrorState({
    this.message,
  });
}

