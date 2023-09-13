part of 'user_details_bloc.dart';

sealed class UserDetailsState extends Equatable {
  final User? user;
  const UserDetailsState({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoadingState extends UserDetailsState {}

class UserDetailsSuccessState extends UserDetailsState {
  const UserDetailsSuccessState({
    required super.user,
  });
}

class UserDetailsErrorState extends UserDetailsState {
  final String? message;

  const UserDetailsErrorState({
    this.message,
  });
}
