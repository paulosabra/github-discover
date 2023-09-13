import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_state.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_event.dart';



class SearchRepositoryBloc
    extends Bloc<RepositoriesSearchEvent, RepositoriesSearchState> {

  SearchRepositoryBloc() : super(const RepositoriesSearchInitialState(repository: [])) {
    on<RepositoriesSearchEvent>(_onSearchRepositoryInitalEvent);

  }


  void _onSearchRepositoryInitalEvent(RepositoriesSearchEvent event, Emitter emit) async {

    emit(const RepositoriesSearchSuccessState(repository: [kRepositoryMock]));
    
  }
}
