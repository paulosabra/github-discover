part of 'users_details_bloc.dart';

sealed class DetailUsersEvent extends Equatable {
  const DetailUsersEvent();

  @override
  List<Object> get props => [];
}

class ListDetailUsersEvent extends DetailUsersEvent {
  final Users users;

  const ListDetailUsersEvent({required this.users});
}
