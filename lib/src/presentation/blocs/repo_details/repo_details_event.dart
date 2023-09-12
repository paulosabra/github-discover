part of 'repo_details_bloc.dart';

sealed class RepoDetailsEvent extends Equatable {
  const RepoDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepoDetailsInitialEvent extends RepoDetailsEvent {
  // final int? id;

  // const RepoDetailsInitialEvent({
  //   this.id,
  // });
}

class RepoDetailsSearchEvent extends RepoDetailsEvent {
  final int id;

  const RepoDetailsSearchEvent({
    required this.id,
  });
}

class RepoDetailsLoadingEvent extends RepoDetailsEvent {}
