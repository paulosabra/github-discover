import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';

import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_search_event.dart';
part 'repository_search_state.dart';

class RepositorySearchBloc extends Bloc<RepositorySearchEvent, RepositorySearchState> {
  RepositorySearchBloc() : super(RepositorySearchInitial()) {
    on<RepositorySearchInitialEvent>(_onRepositoryInitialEvent);
    on<RepositorySearchLoadingEvent>(_onRepositoryLoadingEvent);
    on<RepositorySearchEmptyEvent>(_onRepositoryEmptyEvent);
    on<RepositorySearchQueryEvent>(_onRepositorySearchQueryEvent);
  }
}

void _onRepositoryInitialEvent(
    RepositorySearchInitialEvent event, Emitter emit) async {
  emit(RepositorySearchInitial());
}

void _onRepositoryLoadingEvent(
    RepositorySearchLoadingEvent event, Emitter emit) async {
  emit(RepositorySearchLoadingState());
}

void _onRepositoryEmptyEvent(
    RepositorySearchEmptyEvent event, Emitter emit) async {
  emit(RepositorySearchEmptyState());
}

void _onRepositorySearchQueryEvent(RepositorySearchQueryEvent event, Emitter emit) async {
  try {
    final repositoryName = event.enteredValue.toLowerCase().trim();

    if (repositoryName.isEmpty) {
      emit(const RepositorySearchErrorState(message: 'Type a repository name'));
    } else if (kRepositoryMock.name?.toLowerCase().startsWith(repositoryName) ?? false) {
      emit(const RepositorySearchSuccessState(
          repository: kRepositoryMock, quantityFound: 1));
    } else {
      emit(const RepositorySearchErrorState(message: 'Non-existent repository'));
    }
  } catch (e) {
    emit(const RepositorySearchErrorState(message: 'Error'));
  }
}
