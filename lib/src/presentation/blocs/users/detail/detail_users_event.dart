part of 'detail_users_bloc.dart';

sealed class DetailUsersEvent extends Equatable {
  const DetailUsersEvent();

  @override
  List<Object> get props => [];
}

class LoadingUserEvent extends DetailUsersEvent {
  final User user;

  const LoadingUserEvent({required this.user});
}
