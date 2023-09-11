part of 'users_details_bloc.dart';

sealed class UsersDetailsState extends Equatable {
  final Users? users;
  final Repository? repository;

  const UsersDetailsState({
    this.repository,
    this.users
  });
  
  @override
  List<Object> get props => [];
}

final class UsersDetailsInitial extends UsersDetailsState {}

class UsersDetailsLoadingInitialState extends UsersDetailsState {}

class UsersDetailsSuccessState extends UsersDetailsState {
  const UsersDetailsSuccessState({
    required super.repository,
    required super.users
    });
}

class UsersDetailsErrorState extends UsersDetailsState {
  final String? message;

  const UsersDetailsErrorState({
    this.message,
  });
}


