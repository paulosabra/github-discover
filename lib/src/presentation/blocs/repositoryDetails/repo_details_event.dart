part of 'repo_details_bloc.dart';

sealed class RepoDetailsEvent extends Equatable {
  const RepoDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepoDetailsInitalEvent extends RepoDetailsEvent {}

class RepoDetailsloadEvent extends RepoDetailsEvent {
  RepoDetailsloadEvent();
}