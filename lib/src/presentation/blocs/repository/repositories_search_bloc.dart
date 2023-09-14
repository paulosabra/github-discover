import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repositories_search_event.dart';
part 'repositories_search_state.dart';

class RepositoriesSearchBloc
    extends Bloc<RepositoriesSearchEvent, RepositoriesSearchState> {
  RepositoriesSearchBloc()
      : super(const RepositoriesSearchInitial(repositories: [])) {
    on<RepositorySearchEvent>(_onRepositorySearchEvent);
  }

  void _onRepositorySearchEvent(
    RepositorySearchEvent event,
    Emitter emit,
  ) async {
    emit(const RepositoriesSearchLoadingState(repositories: []));

    await Future.delayed(const Duration(seconds: 1));

    if (event.searchString.isEmpty) {
      emit(const RepositoriesSearchErrorState(
          repositories: [], message: "Ocorreu um erro"));
    } else {
      emit(const RepositoriesSearchSuccessState(repositories: [kRepositoryMock]));
    }
  }
}
