part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}

class UserDetailsInitalEvent extends UserDetailsEvent {}

class UserDetailsLoadEvent extends UserDetailsEvent {
  UserDetailsLoadEvent();
}
