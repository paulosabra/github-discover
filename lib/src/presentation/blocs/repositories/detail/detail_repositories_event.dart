part of 'detail_repositories_bloc.dart';

sealed class DetailRepositoriesEvent extends Equatable {
  const DetailRepositoriesEvent();

  @override
  List<Object> get props => [];
}

class RepositoryLoadingEvent extends DetailRepositoriesEvent {
  final Repository repository;

  const RepositoryLoadingEvent({required this.repository});
}
