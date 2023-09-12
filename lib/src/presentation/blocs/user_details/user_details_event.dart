part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}
class UserDetailsInitialEvent extends UserDetailsEvent {}

class UserDetailsLoadingEvent extends UserDetailsEvent {
  final int userKey;

  const UserDetailsLoadingEvent({
    required this.userKey,
  });
}

class UserDetailsSuccessEvent extends UserDetailsEvent {
  final User user;

  const UserDetailsSuccessEvent({
    required this.user,
  });
}
