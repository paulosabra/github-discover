import 'package:equatable/equatable.dart';

sealed class RepositoriesSearchEvent extends Equatable {
  const RepositoriesSearchEvent();

  @override
  List<Object> get props => [];
}

class FindRepositoriesEvent extends RepositoriesSearchEvent {
  final String searchString;
  const FindRepositoriesEvent({required this.searchString});
}
