part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}


class UsersInitialEvent extends UsersEvent {}


class UsersSearchEvent extends UsersEvent {

  final String search;

  const UsersSearchEvent({
    required this.search
  });

}
