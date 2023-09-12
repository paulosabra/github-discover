part of 'user_search_bloc.dart';

sealed class UserSearchEvent extends Equatable {
  const UserSearchEvent();

  @override
  List<Object> get props => [];
}

class UserSearchInitialEvent extends UserSearchEvent {}

class UserSearchLoadingEvent extends UserSearchEvent {}

class UserSearchEmptyEvent extends UserSearchEvent {}

class UserSearchQueryEvent extends UserSearchEvent {
  final String enteredValue;

  const UserSearchQueryEvent({
    required this.enteredValue,
  });
}