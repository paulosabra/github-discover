part of 'users_search_bloc.dart';

sealed class SearchUsersEvent extends Equatable {
  const SearchUsersEvent();

  @override
  List<Object> get props => [];
}

class FindUsersEvent extends SearchUsersEvent {
  final String searchString;
  const FindUsersEvent({required this.searchString});
}
