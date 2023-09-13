part of 'repositories_details_bloc.dart';

sealed class RepositoriesDetailsEvent extends Equatable {
  const RepositoriesDetailsEvent();

  @override
  List<Object> get props => [];
}

class ListDetailsRepositoriesEvent extends RepositoriesDetailsEvent {
  final Repository repository;

  const ListDetailsRepositoriesEvent({required this.repository});
}
