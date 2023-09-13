part of 'details_user_bloc.dart';

sealed class DetailsUserEvent extends Equatable {
  const DetailsUserEvent();

  @override
  List<Object> get props => [];
}

class ShowDetailsUserEventextends extends DetailsUserEvent {
  const ShowDetailsUserEventextends();
}
