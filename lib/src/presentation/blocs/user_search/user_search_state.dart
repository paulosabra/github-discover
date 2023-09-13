part of 'user_search_bloc.dart';

sealed class UserSearchState extends Equatable {
  final Profile? profile;
  const UserSearchState({
    this.profile,
  });
  
  @override
  List<Object> get props => [];
}

final class UserSearchInitial extends UserSearchState {}

class UserSearchLoadingState extends UserSearchState {}

class UserSearchSuccessState extends UserSearchState {
  const UserSearchSuccessState({
    required super.profile,
  });
}

class UserSearchErrorState extends UserSearchState {
  final String? message;

  const UserSearchErrorState({
    this.message,
  });
}