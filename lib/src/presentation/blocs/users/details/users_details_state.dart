part of 'users_details_bloc.dart';

sealed class DetailsUsersState extends Equatable {
  final Users? users;

  const DetailsUsersState({this.users});

  @override
  List<Object?> get props => [users];
}

final class DetailsUsersInitial extends DetailsUsersState {
  const DetailsUsersInitial();
}

class DetailsUsersLoading extends DetailsUsersState {
  const DetailsUsersLoading();
}

class DetailsUsersSuccess extends DetailsUsersState {
  const DetailsUsersSuccess({required super.users});
}

class DetailsUsersError extends DetailsUsersState {
  final String error;

  const DetailsUsersError({required this.error});
}
