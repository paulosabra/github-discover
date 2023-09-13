part of 'details_repository_bloc.dart';

sealed class DetailsRepositoryState extends Equatable {
  final Repository? repository; 
  
  const DetailsRepositoryState({
    this.repository
  });
  
  @override
  List<Object> get props => [];
}

final class DetailsRepositoryInitial extends DetailsRepositoryState {}

class DetailsRepositorySuccessState extends DetailsRepositoryState {
  const DetailsRepositorySuccessState({
    required super.repository,
  });
}

class DetailsRepositoryErrorState extends DetailsRepositoryState {
  final String? message;

  const DetailsRepositoryErrorState({
    this.message,
  });
}

class DetailsRepositorySearchState extends DetailsRepositoryState {
  final int? id;

  const DetailsRepositorySearchState({
    required this.id,
  });
}