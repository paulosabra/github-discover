part of 'detail_users_bloc.dart';

sealed class DetailUsersState extends Equatable {
  final User? user;

  const DetailUsersState({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

final class DetailUsersInitial extends DetailUsersState {}

class DetailUsersLoading extends DetailUsersState {
  const DetailUsersLoading();
}

class DetailUsersSuccess extends DetailUsersState {
  const DetailUsersSuccess({required super.user});
}

class DetailUsersError extends DetailUsersState {
  final String errorMessage;

  const DetailUsersError({required this.errorMessage});
}
