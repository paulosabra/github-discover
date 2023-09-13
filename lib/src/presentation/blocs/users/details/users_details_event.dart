part of 'users_details_bloc.dart';

sealed class UsersDetailsEvent extends Equatable {
  const UsersDetailsEvent();

  @override
  List<Object> get props => [];
}

class UserLoadingEvent extends UsersDetailsEvent {
  final User user;

  const UserLoadingEvent({required this.user});
}
