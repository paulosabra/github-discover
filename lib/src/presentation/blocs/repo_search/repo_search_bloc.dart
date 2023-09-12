import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_list_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repo_search_event.dart';
part 'repo_search_state.dart';

class RepoSearchBloc extends Bloc<RepoSearchEvent, RepoSearchState> {
  RepoSearchBloc() : super(RepoSearchInitial()) {
    on<RepoSearchSearchEvent>(_onRepoSearchSearchEvent);
    on<RepoSearchInitialEvent>(_onRepoSearchInitialEvent);
  }

  void _onRepoSearchInitialEvent(
    RepoSearchInitialEvent event,
    Emitter emit,
  ) async {
    emit(RepoSearchSuccessState(filteredRepos: kRepositoryListMock));
  }

  void _onRepoSearchSearchEvent(
    RepoSearchSearchEvent event,
    Emitter emit,
  ) async {
    final repoName = event.repoName;
    Repositories filteredRepositories = [];

    // Mapeia a lista de repostitórios e busca items com o nome passado na busca de repositórios.
    filteredRepositories = kRepositoryListMock
        .where(
          (repository) => repository.name!.toUpperCase().contains(
                repoName.toUpperCase(),
              ),
        )
        .toList();

    // Testa se a lista é vazia, se for, utiliza o state de notFound. Caso não seja vazia, utiliza o de sucesso.
    filteredRepositories.isEmpty
        ? emit(
            RepoSearchNotFoundState(
              notFoundMessage: 'Repositório não encontrado.',
            ),
          )
        : emit(
            RepoSearchSuccessState(
              filteredRepos: filteredRepositories,
            ),
          );
  }
}
