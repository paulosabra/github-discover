import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'search_repository_event.dart';
part 'search_repository_state.dart';

class SearchRepositoryBloc extends Bloc<SearchRepositoryEvent, SearchRepositoryState> {
  SearchRepositoryBloc() : super(SearchRepositoryInitial()) {
    on<SearchRepositoryEvent>((event, emit) {

    });
  }
}
