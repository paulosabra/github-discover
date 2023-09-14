part of 'users_details_bloc.dart';

sealed class UsersDetailsState extends Equatable {
  final User? user;

  const UsersDetailsState({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

final class UsersDetailsInitial extends UsersDetailsState {}

class UsersDetailsLoading extends UsersDetailsState {
  const UsersDetailsLoading();
}

class UsersDetailsSuccess extends UsersDetailsState {
  const UsersDetailsSuccess({required super.user});
}

class UsersDetailsError extends UsersDetailsState {
  final String message;

  const UsersDetailsError({required this.message});
}
