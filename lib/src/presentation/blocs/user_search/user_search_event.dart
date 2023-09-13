part of 'user_search_bloc.dart';

sealed class UserSearchEvent extends Equatable {
  const UserSearchEvent();

  @override
  List<Object> get props => [];
}

class UserSearchInitalEvent extends UserSearchEvent {}

class UserSearchSearchEvent extends UserSearchEvent {
  UserSearchSearchEvent();
}