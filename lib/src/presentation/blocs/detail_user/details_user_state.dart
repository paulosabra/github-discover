part of 'details_user_bloc.dart';

sealed class DetailsUserState extends Equatable {
  const DetailsUserState();
  
  @override
  List<Object> get props => [];
}

final class DetailsUserInitial extends DetailsUserState {}
