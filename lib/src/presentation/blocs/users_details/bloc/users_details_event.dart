part of 'users_details_bloc.dart';

sealed class UsersDetailsEvent extends Equatable {
  const UsersDetailsEvent();

  @override
  List<Object> get props => [];
}

class UsersDetailsInitalEvent extends UsersDetailsEvent {}

class UsersDetailsLoadingEvent extends UsersDetailsEvent {}
