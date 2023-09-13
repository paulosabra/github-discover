part of 'repo_details_bloc.dart';

sealed class RepoDetailsState extends Equatable {
 final Repository? repository;

 const RepoDetailsState({
  this.repository
 });
  
  @override
  List<Object> get props => [];
}

final class RepoDetailsInitial extends RepoDetailsState {}

class RepoDetailsLoadingState extends RepoDetailsState {}

class RepoDetailsSuccessState extends RepoDetailsState {
  const RepoDetailsSuccessState({
    required super.repository,
  });
}

class RepoDetailsErrorState extends RepoDetailsState {
  final String? message;

  const RepoDetailsErrorState({
    this.message,
  });
}

