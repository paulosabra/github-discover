part of 'repositories_details_bloc.dart';

sealed class RepositoriesDetailsEvent extends Equatable {
  const RepositoriesDetailsEvent();

  @override
  List<Object> get props => [];
}

class RepositoryLoadingEvent extends RepositoriesDetailsEvent {
  final Repository repository;

  const RepositoryLoadingEvent({required this.repository});
}
