part of 'detail_repositories_bloc.dart';

sealed class DetailRepositoriesState extends Equatable {
  final Repository? repository;

  const DetailRepositoriesState({
    this.repository,
  });

  @override
  List<Object?> get props => [repository];
}

final class DetailRepositoriesInitial extends DetailRepositoriesState {
  const DetailRepositoriesInitial();
}

final class DetailRepositoriesError extends DetailRepositoriesState {
  final String messageError;

  const DetailRepositoriesError({required this.messageError});
}

final class DetailRepositoriesSucess extends DetailRepositoriesState {
  const DetailRepositoriesSucess({required super.repository});
}

final class DetailRepositoriesLoading extends DetailRepositoriesState {
  const DetailRepositoriesLoading();
}
