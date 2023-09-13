part of 'details_user_bloc.dart';

sealed class DetailsUserEvent extends Equatable {
  const DetailsUserEvent();

  @override
  List<Object> get props => [];
}

class DetailsUserInitialEvent extends DetailsUserEvent {}

class ShowDetailsUserEvent extends DetailsUserEvent {
  final int id;

  const ShowDetailsUserEvent({
    required this.id,
  });
}
