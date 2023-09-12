part of 'repo_details_bloc.dart';

sealed class RepoDetailsState extends Equatable {
  Repository? repo;

  RepoDetailsState({
    this.repo,
  });

  @override
  List<Object?> get props => [repo];
}

final class RepoDetailsInitial extends RepoDetailsState {
  final Repository? repository;

  RepoDetailsInitial({this.repository});
}

final class RepoDetailsLoadingState extends RepoDetailsState {}

final class RepoDetailsSuccessState extends RepoDetailsState {
  final Repository? repository;

  RepoDetailsSuccessState({
    this.repository = kRepositoryMock,
  }) {
    super.repo = repository;
  }
}

final class RepoDetailsFailState extends RepoDetailsState {
  final String? errorMessage;

  RepoDetailsFailState({
    required this.errorMessage,
  });
}
