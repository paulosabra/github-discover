import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
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
    await Future.delayed(const Duration(seconds: 2));
    print(event.searchString);
    if (event.searchString.isEmpty) {
      emit(const SearchRepositoriesErrorState(
          repository: [], error: "Alguma coisa aconteceu errado"));
      print('print IF' + event.searchString);
    } else {
      print('print else' + event.searchString);
      emit(const SearchRepositoriesSucessState(repository: [kRepositoryMock]));
    }
  }
}
