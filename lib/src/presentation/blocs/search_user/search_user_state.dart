part of 'search_user_bloc.dart';

sealed class SearchUserState extends Equatable {
  final Profile? profile;

  const SearchUserState({
    this.profile,
  });
  
  @override
  List<Object> get props => [];
}

final class SearchUserInitial extends SearchUserState {}

class SearchUserSuccessState extends SearchUserState {
  const SearchUserSuccessState({
    required super.profile,
  });
}

class SearchUserErrorState extends SearchUserState {
  final String? message;

  const SearchUserErrorState({
    this.message,
  });
}
