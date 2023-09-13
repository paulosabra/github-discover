part of 'search_user_bloc.dart';

sealed class SearchUserState extends Equatable {
  final User? user;

  const SearchUserState({
    this.user,
  });
  
  @override
  List<Object> get props => [];
}

final class SearchUserInitial extends SearchUserState {}

class SearchUserSuccessState extends SearchUserState {
  const SearchUserSuccessState({
    required super.user,
  });
}

class SearchUserErrorState extends SearchUserState {
  final String? message;

  const SearchUserErrorState({
    this.message,
  });
}

class SearchUserEmptyState extends SearchUserState {
  final String? message;

  const SearchUserEmptyState({
    this.message
  });
}