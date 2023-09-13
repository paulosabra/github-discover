import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repo_search_event.dart';
part 'repo_search_state.dart';

class RepoSearchBloc extends Bloc<RepoSearchEvent, RepoSearchState> {
  RepoSearchBloc() : super(RepoSearchInitial()) {
    on<RepoSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
