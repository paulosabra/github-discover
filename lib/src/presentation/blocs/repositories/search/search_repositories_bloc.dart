import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/license.dart';
import 'package:github_discover/src/domain/entities/owner.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'search_repositories_event.dart';
part 'search_repositories_state.dart';

class SearchRepositoriesBloc
    extends Bloc<SearchRepositoriesEvent, SearchRepositoriesState> {
  SearchRepositoriesBloc()
      : super(const SearchRepositoriesInitial(repository: [])) {
    on<RepositorySearchEvent>(_onSearchRepositoryEvent);
  }

  void _onSearchRepositoryEvent(
    RepositorySearchEvent event,
    Emitter emit,
  ) async {
    emit(const SearchRepositoriesLoadingState(repository: []));

    print(event.searchString);
    if (event.searchString.isEmpty) {
      emit(const SearchRepositoriesErrorState(
          repository: [], error: "Alguma coisa aconteceu errado"));
      print('print IF' + event.searchString);
    } else {
      print('print else' + event.searchString);
      emit(SearchRepositoriesSucessState(repository: [
        Repository(
          id: 0,
          name: event.searchString,
          fullName: 'fiap/fiap',
          private: true,
          owner: const Owner(
            id: 0,
            login: 'fiap',
            avatarUrl:
                'https://media.licdn.com/dms/image/C4D0BAQFGUHRJ26bFDw/company-logo_200_200/0/1519856619408?e=1699488000&v=beta&t=ZmHH9S3D3olLSwAS_Egw862invpc80wKT_Gd0C3n2A0',
          ),
          htmlUrl: '',
          license: const License(
            name: 'MIT License',
            spdxId: 'MIT',
            url: 'https://api.github.com/licenses/mit',
          ),
          language: 'Dart',
          description: 'Cross Platform Engineer',
          visibility: 'public',
          fork: false,
          forksCount: 3,
          stargazersCount: 30,
          subscribersCount: 2,
          createdAt: '',
          updatedAt: '',
          pushedAt: '',
        )
      ]));
    }
  }
}
