part of 'repositories_details_bloc.dart';

sealed class RepositoriesDetailsState extends Equatable {
  final Repository? repository;


  const RepositoriesDetailsState({this.repository});

  @override
  List<Object?> get props => [repository];
}

final class RepositoriesDetailsInitial extends RepositoriesDetailsState {
  const RepositoriesDetailsInitial();
}

class RepositoriesDetailsLoading extends RepositoriesDetailsState {
  const RepositoriesDetailsLoading();
}

class RepositoriesDetailsSuccess extends RepositoriesDetailsState {
  const RepositoriesDetailsSuccess({required super.repository});
}

class RepositoriesDetailsError extends RepositoriesDetailsState {
  final String error;

  const RepositoriesDetailsError({required this.error});
}
