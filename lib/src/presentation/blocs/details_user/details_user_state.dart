part of 'details_user_bloc.dart';

sealed class DetailsUserState extends Equatable {
  final User? user;

  const DetailsUserState({
    this.user
  });
  
  @override
  List<Object> get props => [];
}

final class DetailsUserInitial extends DetailsUserState {}

class DetailsUserSuccessState extends DetailsUserState {
  const DetailsUserSuccessState({
    required super.user
  });
}

class DetailsUserErrorState extends DetailsUserState {
  final String? message;

  const DetailsUserErrorState({this.message});
}

class DetailsUserSearchState extends DetailsUserState {
  final int? id;

  const DetailsUserSearchState({
    required this.id,
  });
}