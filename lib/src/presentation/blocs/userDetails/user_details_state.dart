part of 'user_details_bloc.dart';

sealed class UserDetailsState extends Equatable {
  final Profile? profile;
  const UserDetailsState({
    this.profile
  });
  
  @override
  List<Object> get props => [];
}

final class UserDetailsInitial extends UserDetailsState {}

class UserDetailsStateLoadingState extends UserDetailsState {}

class UserDetailsStateSuccessState extends UserDetailsState {
  const UserDetailsStateSuccessState({
    required super.profile,
  });
}

class UserDetailsStateErrorState extends UserDetailsState {
  final String? message;

  const UserDetailsStateErrorState({
    this.message,
  });
}
